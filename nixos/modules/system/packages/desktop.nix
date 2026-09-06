{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Desktop utilities
    libnotify brightnessctl cliphist trash-cli app2unit
    inotify-tools

    # Wayland screenshot / clipboard / input
    wl-clipboard grim slurp wev pamixer

    # Terminal
    foot

    # GTK / Qt theming
    adw-gtk3 bibata-cursors papirus-icon-theme adwaita-icon-theme
    kdePackages.qt6ct

    # Bluetooth / network / audio GUI (для waybar on-click)
    blueman pavucontrol networkmanagerapplet

  ];
}
