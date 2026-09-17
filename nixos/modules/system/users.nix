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
      "gamemode"
    ];

    shell = pkgs.zsh;
  };
}
