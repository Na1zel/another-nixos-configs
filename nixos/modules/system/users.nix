{ config, pkgs, ... }:

{
  users.users.naizel = {
    isNormalUser = true;
    description = "naizel";

    extraGroups = [
      "networkmanager"
      "wheel"
      "video"
      "i2c"
      "wireshark"
      "gamemode"
    ];

    shell = pkgs.fish;
  };
}
