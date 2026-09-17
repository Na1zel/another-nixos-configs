{ pkgs, ... }:

{
  # Power management
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;
  powerManagement.cpuFreqGovernor = "performance";

  # Desktop / filesystem integration
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.tumbler.enable = true;
  services.accounts-daemon.enable = true;
  programs.dconf.enable = true;

  # Hardware control
  services.ddccontrol.enable = true;

  # Security
  security.polkit.enable = true;

  # Programs
  programs.kdeconnect.enable = true;
  programs.partition-manager.enable = true;

  # Network analysis
}
