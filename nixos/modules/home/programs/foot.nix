{ ... }:

{
  # ============================================================
  # Foot
  # ============================================================

  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "JetBrainsMono Nerd Font Mono:size=12";
        pad = "0x0";
        term = "xterm-256color";
        selection-target = "clipboard";
      };

      scrollback = {
        lines = 3000;
      };

      cursor = {
        style = "block";
        blink = "no";
      };

      colors = {
        background = "000000";
        foreground = "dddddd";

        selection-foreground = "000000";
        selection-background = "fffacd";

        regular0 = "000000";
        regular1 = "cc0403";
        regular2 = "19cb00";
        regular3 = "cecb00";
        regular4 = "0d73cc";
        regular5 = "cb1ed1";
        regular6 = "0dcdcd";
        regular7 = "dddddd";

        bright0 = "767676";
        bright1 = "f2201f";
        bright2 = "23fd00";
        bright3 = "fffd00";
        bright4 = "1a8fff";
        bright5 = "fd28ff";
        bright6 = "14ffff";
        bright7 = "ffffff";
      };

      key-bindings = {
        fullscreen = "F11";
        spawn-terminal = "Control+Shift+t";
        font-increase = "Control+plus Control+equal";
        font-decrease = "Control+minus";
        font-reset = "Control+0";
      };
    };
  };
}
