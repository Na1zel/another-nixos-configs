{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Gaming
    mangohud faugus-launcher mesa-demos gwe vkbasalt vkbasalt-cli rusty-path-of-building
    vulkan-tools goverlay heroic prismlauncher
    steam-run steamcmd

    #nzportable # убрать когда выйдет уже 2.0.0 стабильный релиз
    #angband # убрать если хочешь поставить
    #supertux # убрать если хочешь поставить
    #supertuxkart # убрать когда выйдет 2.0 evoltuin обновление

  ];
}
