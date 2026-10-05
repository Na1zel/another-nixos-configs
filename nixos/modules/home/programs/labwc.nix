{ pkgs, lib, ... }:
let
  setwall = pkgs.writeShellScriptBin "setwall" ''
    [ -f "$1" ] || { echo "usage: setwall <image>"; exit 1; }
    ${pkgs.coreutils}/bin/ln -sf "$(${pkgs.coreutils}/bin/realpath "$1")" "$HOME/.config/current-wallpaper"
    ${pkgs.procps}/bin/pkill swaybg
    ${pkgs.util-linux}/bin/setsid ${pkgs.swaybg}/bin/swaybg -i "$HOME/.config/current-wallpaper" -m fill >/dev/null 2>&1 &
  '';

  wallpaperMenu = pkgs.writeShellScript "wallpaper-menu" ''
    esc() {
      ${pkgs.gnused}/bin/sed -e 's/&/\&amp;/g' -e 's/</\&lt;/g' -e 's/>/\&gt;/g' -e 's/"/\&quot;/g'
    }
    echo '<openbox_pipe_menu>'
    for f in "$HOME"/Pictures/Wallpapers/*; do
      [ -f "$f" ] || continue
      n=$(${pkgs.coreutils}/bin/basename "$f" | esc)
      p=$(printf '%s' "$f" | esc)
      echo "<item label=\"$n\"><action name=\"Execute\"><command>${setwall}/bin/setwall '$p'</command></action></item>"
    done
    echo '</openbox_pipe_menu>'
  '';

  # Меняет громкость и пишет новое значение в канал для wob (полоска на слое overlay).
  # timeout нужен, чтобы запись не зависла, если wob не запущен.
  volctl = pkgs.writeShellScriptBin "volctl" ''
    sink=@DEFAULT_AUDIO_SINK@
    wpctl=${pkgs.wireplumber}/bin/wpctl
    case "$1" in
      up)   $wpctl set-volume -l 1.0 $sink 5%+ ;;
      down) $wpctl set-volume $sink 5%- ;;
      mute) $wpctl set-mute $sink toggle ;;
      max)  $wpctl set-volume $sink 1.0 ;;
    esac
    if $wpctl get-volume $sink | ${pkgs.gnugrep}/bin/grep -q MUTED; then
      v=0
    else
      v=$($wpctl get-volume $sink | ${pkgs.gawk}/bin/awk '{printf "%d", $2*100}')
    fi
    printf '%s\n' "$v" | ${pkgs.coreutils}/bin/timeout 1 ${pkgs.coreutils}/bin/tee "$XDG_RUNTIME_DIR/wob.sock" >/dev/null
  '';

  # Яркость через wl-gammarelay-rs (программное затемнение через gamma, работает на любом мониторе).
  # Нижний предел 10%, чтобы случайно не уйти в чёрный экран.
  # Значение сохраняется в ~/.local/state/brightness и восстанавливается при входе (brightctl restore).
  brightctl = pkgs.writeShellScriptBin "brightctl" ''
    busctl=${pkgs.systemd}/bin/busctl
    c=${pkgs.coreutils}/bin
    awk=${pkgs.gawk}/bin/awk
    dest="rs.wl-gammarelay / rs.wl.gammarelay"
    state="$HOME/.local/state/brightness"
    $c/mkdir -p "$HOME/.local/state"

    if [ "$1" = "restore" ]; then
      [ -r "$state" ] || exit 0
      # ждём, пока wl-gammarelay-rs поднимется
      for i in $($c/seq 1 40); do
        $busctl --user get-property $dest Brightness >/dev/null 2>&1 && break
        $c/sleep 0.25
      done
      b=$($awk -v v="$($c/cat "$state")" 'BEGIN { v += 0; if (v < 10) v = 10; if (v > 100) v = 100; printf "%.2f", v / 100 }')
      $busctl --user set-property $dest Brightness d "$b"
      exit 0
    fi

    case "$1" in
      up)    $busctl --user -- call $dest UpdateBrightness d 0.05 ;;
      down)  $busctl --user -- call $dest UpdateBrightness d -0.05 ;;
      reset) $busctl --user set-property $dest Brightness d 1 ;;
    esac
    v=$($busctl --user get-property $dest Brightness | $awk '{printf "%d", $2*100+0.5}')
    if [ "$v" -lt 10 ]; then
      $busctl --user set-property $dest Brightness d 0.1
      v=10
    fi
    printf '%s\n' "$v" > "$state"
    printf '%s\n' "$v" | $c/timeout 1 $c/tee "$XDG_RUNTIME_DIR/wob-bright.sock" >/dev/null
  '';
in {
  wayland.windowManager.labwc = {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    rc = {
      desktops = { number = 5; popupTime = 0; };
      margin = { "@top" = 0; "@bottom" = 0; "@left" = 0; "@right" = 0; };
      snapping = {
        overlay = {
          enabled = "no";
        };
      };
      libinput = {
        device = {
          "@category" = "default";
          accelProfile = "flat";
        };
      };
      mouse = {
        default = true;
        context = [{
          "@name" = "Root";
          mousebind = [
            { "@direction" = "Up"; "@action" = "Scroll"; action = { "@name" = "None"; }; }
            { "@direction" = "Down"; "@action" = "Scroll"; action = { "@name" = "None"; }; }
          ];
        }];
      };
      keyboard = {
        default = true;
        keybind = [
          { "@key" = "W-Return"; action = { "@name" = "Execute"; "@command" = "foot"; }; }
          { "@key" = "W-w"; action = { "@name" = "Execute"; "@command" = "sh -c 'pkill fuzzel || fuzzel'"; }; }
          { "@key" = "W-s"; action = { "@name" = "Iconify"; }; }
          { "@key" = "W-S-b"; action = { "@name" = "Execute"; "@command" = "sh -c 'pkill waybar || waybar'"; }; }

          { "@key" = "W-q"; action = { "@name" = "Close"; }; }
          { "@key" = "W-f"; action = { "@name" = "ToggleFullscreen"; }; }
          { "@key" = "Print"; action = { "@name" = "Execute"; "@command" = "sh -c 'grim -g \"$(slurp)\" - | wl-copy'"; }; }

          { "@key" = "W-F6";  action = { "@name" = "Execute"; "@command" = "${brightctl}/bin/brightctl down"; }; }
          { "@key" = "W-F7";  action = { "@name" = "Execute"; "@command" = "${brightctl}/bin/brightctl up"; }; }

          { "@key" = "W-F9";  action = { "@name" = "Execute"; "@command" = "${volctl}/bin/volctl mute"; }; }
          { "@key" = "W-F10"; action = { "@name" = "Execute"; "@command" = "${volctl}/bin/volctl down"; }; }
          { "@key" = "W-F11"; action = { "@name" = "Execute"; "@command" = "${volctl}/bin/volctl up"; }; }
          { "@key" = "W-F12"; action = { "@name" = "Execute"; "@command" = "${volctl}/bin/volctl max"; }; }

          { "@key" = "W-l"; action = { "@name" = "Execute"; "@command" = "swaylock -f"; }; }
        ]
        ++ (map (n: {
          "@key" = "W-${toString n}";
          action = { "@name" = "GoToDesktop"; "@to" = toString n; };
        }) (lib.range 1 5))
        ++ (map (n: {
          "@key" = "W-S-${toString n}";
          action = { "@name" = "SendToDesktop"; "@to" = toString n; };
        }) (lib.range 1 5));
      };
    };
    environment = [
      "XKB_DEFAULT_LAYOUT=us,ru"
      "XKB_DEFAULT_OPTIONS=grp:alt_shift_toggle,grp_led:scroll"
      "XCURSOR_THEME=Vanilla-DMZ-AA"
      "XCURSOR_SIZE=24"
    ];
    autostart = [
      "wl-gammarelay-rs run &"
      "${brightctl}/bin/brightctl restore &"
      "waybar &"
      "mako &"
      "sh -c 'rm -f \"$XDG_RUNTIME_DIR/wob.sock\"; mkfifo \"$XDG_RUNTIME_DIR/wob.sock\"; tail -f \"$XDG_RUNTIME_DIR/wob.sock\" | wob' &"
      "sh -c 'rm -f \"$XDG_RUNTIME_DIR/wob-bright.sock\"; mkfifo \"$XDG_RUNTIME_DIR/wob-bright.sock\"; tail -f \"$XDG_RUNTIME_DIR/wob-bright.sock\" | wob -c \"$HOME/.config/wob/bright.ini\"' &"
      "if [ -e \"$HOME/.config/current-wallpaper\" ]; then swaybg -i \"$HOME/.config/current-wallpaper\" -m fill; else swaybg -c '#000000'; fi &"
      "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &"
      "wlr-randr --output DP-3 --mode 1920x1080@165.003006Hz &"
      "swayidle -w timeout 600 'swaylock -f' &"
    ];
  };

  # Вторая полоска wob (яркость): те же размеры и место, но цвета инвертированы
  xdg.configFile."wob/bright.ini".text = ''
    background_color = FFFFFF
    border_color = 000000
    bar_color = 000000
  '';

  xdg.configFile."labwc/menu.xml".text = ''
    <?xml version="1.0" encoding="UTF-8"?>
    <openbox_menu>
      <menu id="root-menu">
        <item label="Терминал">
          <action name="Execute"><command>foot</command></action>
        </item>
        <menu id="wallpapers" label="Обои" execute="${wallpaperMenu}"/>
        <separator/>
        <item label="Заблокировать">
          <action name="Execute"><command>swaylock -f</command></action>
        </item>
        <item label="Перезагрузка">
          <action name="Execute"><command>systemctl reboot</command></action>
        </item>
        <item label="Выключение">
          <action name="Execute"><command>systemctl poweroff</command></action>
        </item>
        <separator/>
        <item label="Перезагрузить labwc">
          <action name="Reconfigure"/>
        </item>
        <item label="Выйти из сессии">
          <action name="Exit"/>
        </item>
      </menu>
    </openbox_menu>
  '';

  # Нужно, чтобы home-manager сам создавал gtk-3.0/gtk-4.0 settings.ini с темой курсора
  gtk.enable = true;

  # Курсор Vanilla-DMZ, чёрная версия (Vanilla-DMZ = белая, Vanilla-DMZ-AA = чёрная)
  home.pointerCursor = {
    enable = true;
    package = pkgs.vanilla-dmz;
    name = "Vanilla-DMZ-AA";
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };

  home.packages = with pkgs; [
    foot fuzzel
    mako swaybg swayidle
    grim slurp wlr-randr
    wob wl-gammarelay-rs
    setwall
    volctl
    brightctl
  ];
}
