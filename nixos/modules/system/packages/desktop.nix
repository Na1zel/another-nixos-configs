{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Desktop utilities
    #inotify-tools libnotify cliphist trash-cli app2unit
    brightnessctl

    # Wayland screenshot / clipboard / input
    #grim slurp wev pamixer
    kdePackages.qtstyleplugin-kvantum wl-clipboard

    # Terminal
    

    # GTK / Qt theming
    adw-gtk3 bibata-cursors papirus-icon-theme adwaita-icon-theme

    # Bluetooth / network / audio GUI (для waybar on-click)
    #pavucontrol networkmanagerapplet
  ];
}
