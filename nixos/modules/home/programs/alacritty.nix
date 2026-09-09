{ ... }:

{
  programs.alacritty = {
    enable = true;

    settings = {
      env.TERM = "xterm-256color";

      window = {
        padding = {
          x = 0;
          y = 0;
        };
        dynamic_padding = false;
        decorations = "full";
      };

      font = {
        size = 12.0;

        normal = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Regular";
        };

        bold = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Bold";
        };

        italic = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Italic";
        };

        bold_italic = {
          family = "JetBrainsMono Nerd Font Mono";
          style = "Bold Italic";
        };
      };

      scrolling.history = 3000;
      selection.save_to_clipboard = true;

      cursor = {
        style = {
          shape = "Block";
          blinking = "Never";
        };
        vi_mode_style = "None";
      };

      bell.duration = 0;

      colors = {
        primary = {
          background = "#000000";
          foreground = "#dddddd";
        };

        cursor = {
          text = "#111111";
          cursor = "#cccccc";
        };

        selection = {
          text = "#000000";
          background = "#fffacd";
        };

        normal = {
          black = "#000000";
          red = "#cc0403";
          green = "#19cb00";
          yellow = "#cecb00";
          blue = "#0d73cc";
          magenta = "#cb1ed1";
          cyan = "#0dcdcd";
          white = "#dddddd";
        };

        bright = {
          black = "#767676";
          red = "#f2201f";
          green = "#23fd00";
          yellow = "#fffd00";
          blue = "#1a8fff";
          magenta = "#fd28ff";
          cyan = "#14ffff";
          white = "#ffffff";
        };
      };

      keyboard.bindings = [
        {
          key = "F11";
          action = "ToggleFullscreen";
        }
        {
          key = "T";
          mods = "Control|Shift";
          action = "CreateNewWindow";
        }
        {
          key = "Plus";
          mods = "Control";
          action = "IncreaseFontSize";
        }
        {
          key = "Equals";
          mods = "Control";
          action = "IncreaseFontSize";
        }
        {
          key = "Minus";
          mods = "Control";
          action = "DecreaseFontSize";
        }
        {
          key = "Key0";
          mods = "Control";
          action = "ResetFontSize";
        }
      ];
    };
  };
}
