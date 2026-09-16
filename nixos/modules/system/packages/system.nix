{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # System info / monitoring
    fastfetch pfetch-rs inxi dmidecode lshw
    btop-cuda # ставь просто btop если не nvidia
    htop nvtopPackages.full # убери если видеокарта не nvidia
    cmatrix tty-clock pipes-rs bat

    # Boot / firmware / security
    gnupg sbctl efibootmgr

    # Disk / filesystem
    smartmontools ntfs3g exfatprogs libva-utils ncdu duf abootimg iotop-c

    # Hardware enumeration
    pciutils usbutils libusb1

    # Archives
    unzip zip _7zz unar innoextract

    # Terminal file manager / misc CLI
    yazi zellij tldr fzf

    # Debugging / low-level
    strace lsof file fuse fuse3

  ];
}
