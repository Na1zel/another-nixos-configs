{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Desktop utilities
    #inotify-tools libnotify cliphist trash-cli app2unit
    brightnessctl

    # Wayland screenshot / clipboard / input
    #grim slurp wev pamixer
    kdePackages.qtstyleplugin-kvantum wl-clipboard

    # GTK / Qt theming
    adw-gtk3 papirus-icon-theme adwaita-icon-theme darkly
    #bibata-cursors 

    # Bluetooth / network / audio GUI (для waybar on-click)
    #pavucontrol networkmanagerapplet
  ];
}
