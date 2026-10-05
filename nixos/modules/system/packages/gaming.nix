{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Gaming
    mangohud faugus-launcher mesa-demos
    vulkan-tools prismlauncher rusty-path-of-building
    steam-run steamcmd
    #heroic goverlay # поставить goverlay когда починят

    #nzportable # убрать когда выйдет уже 2.0.0 стабильный релиз
    #angband # убрать если хочешь поставить
    #supertux # убрать если хочешь поставить
    #supertuxkart # убрать когда выйдет 2.0 evoltuin обновление

  ];
}
