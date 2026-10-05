{ config, pkgs, pkgs-stable, lib, inputs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./modules/system
  ];

  # ============================================================
  # !!!!!!!!!USB-modeswitch убери этот блок и пакеты usbmodeswitch потому что у тебя потом будет и i2c в users группе 
  # ============================================================

  services.udev.packages = [
    pkgs.usb-modeswitch-data
  ];

  #services.udev.extraRules = ''
  #  ACTION=="add", SUBSYSTEM=="usb", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="1a2b", RUN+="${pkgs.usb-modeswitch}/bin/usb_modeswitch -K -W -v 0bda -p 1a2b"
  #'';

  hardware.usb-modeswitch.enable = true;

  hardware.i2c.enable = true;

  # ============================================================
  # System info
  # ============================================================

  system.stateVersion = "26.05"; # меняй на свою когда будешь ставить первый раз
}
