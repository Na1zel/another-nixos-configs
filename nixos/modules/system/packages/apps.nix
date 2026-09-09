{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Documents / viewers
    zathura imv libreoffice-qt

    # Image / creative / 3D
    krita gimp darktable upscayl upscaler blender

    # Video editing
    kdePackages.kdenlive

    # Communication
    ayugram-desktop vesktop

    # Torrents
    kdePackages.ktorrent

    # KDE utilities
    kdePackages.partitionmanager

    # File manager
    thunar

  ];
}
