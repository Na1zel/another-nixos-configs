{ ... }:

{
  programs.kitty = {
    enable = true;

    settings = {
      font_size = 12;    
      font_family      = "JetBrainsMono Nerd Font Mono";
      bold_font        = "JetBrainsMono Nerd Font Mono Bold";
      italic_font      = "JetBrainsMono Nerd Font Mono Italic";
      bold_italic_font = "JetBrainsMono Nerd Font Mono Bold Italic";
    
      cursor_shape = "block";
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.4";
      cursor_trail_start_threshold = 2;
      cursor_blink_interval = 0;
    };

    keybindings = {
      "f11" = "toggle_fullscreen";
      "ctrl+shift+t" = "new_tab";
      "ctrl+plus" = "change_font_size all +1.0";
      "ctrl+equal" = "change_font_size all +1.0";
      "ctrl+minus" = "change_font_size all -1.0";
      "ctrl+0" = "change_font_size all 0";
    };
  };
}
