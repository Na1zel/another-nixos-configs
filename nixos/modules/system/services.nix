{ pkgs, ... }:

{
  environment.localBinInPath = true;

  # Power management
  services.upower.enable = true;
  services.power-profiles-daemon.enable = false;
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
  programs.fish.enable = true;
  programs.kdeconnect.enable = true;
  programs.partition-manager.enable = true;

  programs.thunar.plugins = with pkgs; [
    thunar-archive-plugin
    thunar-volman
  ];

  # Network analysis
  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
}
