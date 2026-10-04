{ pkgs, ... }:
let
  kbLayout = pkgs.writeShellScript "kb-layout" ''
    last=""
    while true; do
      cur="??"
      for f in /sys/class/leds/input*::scrolllock/brightness; do
        [ -r "$f" ] || continue
        if [ "$(${pkgs.coreutils}/bin/cat "$f")" = "1" ]; then cur="RU"; else cur="US"; fi
        break
      done
      if [ "$cur" != "$last" ]; then echo "$cur"; last="$cur"; fi
      ${pkgs.coreutils}/bin/sleep 0.1
    done
  '';
in {
  programs.waybar = {
    enable = true;
    settings.main = {
      layer = "top";
      position = "top";
      spacing = 0;
      height = 20;
      modules-left = [ "custom/nixos" "ext/workspaces" "wlr/taskbar" "custom/gpu" "cpu" "memory" ];
      modules-center = [ "clock" ];
      modules-right = [
        "group/tray-expander" "bluetooth" "network" "wireplumber"
        "custom/brightness" "custom/layout"
      ];

      "custom/nixos" = {
        format = "<span font='Symbols Nerd Font'>${builtins.fromJSON ''"\uf313"''}</span>";
        on-click = "pkill fuzzel || fuzzel";
      };

      "ext/workspaces" = {
        on-click = "activate";
        format = "{icon}";
        format-icons = {
          default = "·";
          "1" = "1"; "2" = "2"; "3" = "3"; "4" = "4"; "5" = "5";
          active = "󱓻";
        };
        persistent-workspaces = { "1" = []; "2" = []; "3" = []; "4" = []; "5" = []; };
      };

      "wlr/taskbar" = {
        format = "{icon}";
        icon-size = 14;
        on-click = "minimize-raise";
        on-click-middle = "close";
      };

      clock = {
        format = "{:L%A %H:%M}";
        format-alt = "{:L%d %B W%V %Y}";
        tooltip = false;
      };

      "custom/layout" = {
        exec = "${kbLayout}";
        format = "{}";
      };

      "custom/brightness" = {
        exec = "wl-gammarelay-rs watch {bp}";
        format = "${builtins.fromJSON ''"\uf185"''} {}%";
        on-scroll-up = "brightctl up";
        on-scroll-down = "brightctl down";
      };

      "custom/gpu" = {
        exec = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
        interval = 2;
        format = "GPU {}%";
      };

      cpu = {
        interval = 2;
        format = "CPU {usage}%";
      };

      memory = {
        interval = 2;
        format = "RAM {percentage}%";
        tooltip-format = "{used:0.1f}G / {total:0.1f}G";
      };

      network = {
        format-icons = [ "󰤯" "󰤟" "󰤢" "󰤥" "󰤨" ];
        format = "{icon}";
        format-wifi = "{icon}";
        format-ethernet = "󰀂";
        format-disconnected = "󰤮";
        tooltip-format-wifi = "{essid} ({frequency} GHz)\n⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
        tooltip-format-ethernet = "⇣{bandwidthDownBytes}  ⇡{bandwidthUpBytes}";
        tooltip-format-disconnected = "Disconnected";
        interval = 3;
        on-click = "nm-connection-editor";
      };

      bluetooth = {
        format = "󰂯";
        format-off = "󰂲";
        format-disabled = "󰂲";
        format-connected = "󰂱";
        tooltip-format = "Devices connected: {num_connections}";
        on-click = "blueman-manager";
      };

      wireplumber = {
        format = "{icon} {volume}%";
        tooltip-format = "Playing at {volume}%";
        scroll-step = 5;
        format-muted = "󰖁";
        format-icons = { headphone = "󰋋"; headset = "󰋋"; default = [ "󰕿" "󰖀" "󰕾" ]; };
        on-click = "pavucontrol";
      };

      "group/tray-expander" = {
        orientation = "inherit";
        drawer = { transition-duration = 600; children-class = "tray-group-item"; };
        modules = [ "custom/expand-icon" "tray" ];
      };

      "custom/expand-icon" = { format = "‹"; tooltip = false; };

      tray = { icon-size = 12; spacing = 17; };
    };

    style = ''
      * { font-family: monospace, "Symbols Nerd Font"; font-size: 13px; border: none; border-radius: 0; min-height: 0; }
      window#waybar { background: #000000; color: #bbbbbb; }
      #workspaces button { padding: 0 6px; background: transparent; color: #bbbbbb; }
      #workspaces button.active { background: #005577; color: #eeeeee; }
      #custom-nixos, #clock, #custom-layout, #custom-brightness, #custom-gpu, #cpu, #memory, #network, #bluetooth, #wireplumber, #tray { padding: 0 8px; }
      #taskbar button { padding: 0 4px; margin: 0; min-height: 0; }
    '';
  };

  home.packages = with pkgs; [ pavucontrol blueman networkmanagerapplet ];
}
