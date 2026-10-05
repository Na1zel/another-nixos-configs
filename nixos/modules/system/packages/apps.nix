{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Documents / viewers
    zathura libreoffice-qt

    # Image / creative / 3D
    krita gimp darktable upscaler

    # Video editing
    kdePackages.kdenlive

    # Communication
    ayugram-desktop vesktop

    # Torrents
    kdePackages.ktorrent

    # KDE utilities
    kdePackages.partitionmanager kdePackages.isoimagewriter
    #kdePackages.qtstyleplugin-kvantum добавить если надо

    # File manager

  ];
}
