{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Desktop utilities
    #inotify-tools libnotify cliphist trash-cli app2unit
    brightnessctl

    # Wayland screenshot / clipboard / input
    #grim slurp wev pamixer
    wl-clipboard

    # GTK / Qt theming
    adw-gtk3 papirus-icon-theme adwaita-icon-theme kdePackages.oxygen kdePackages.oxygen-sounds
    kdePackages.oxygen-icons

    # Bluetooth / network / audio GUI (для waybar on-click)
    #pavucontrol networkmanagerapplet
  ];

  environment.variables.EDITOR = "vim"; # заменил nano default editor на vim default editor echo $EDITOR
}
