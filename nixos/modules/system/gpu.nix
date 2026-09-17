{ config, pkgs, lib, ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;

    extraPackages = with pkgs; [
      nvidia-vaapi-driver
    ];
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    nvidiaSettings = true;
    modesetting.enable = true;
    nvidiaPersistenced = true;
  };

  environment.sessionVariables = {
    __GL_SHADER_DISK_CACHE_SIZE = "17179869184";
    LIBVA_VDPAU_DRIVER = "nvidia";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    NVD_BACKEND = "direct";
  };
}
# если будут проблему с nvidia то надо удалить этот весь конфиг
# и пересобрать систему и после пересборки надо прописать в micro
# типо когда открываешь какой-то файл нажми ctrl+E и введи set colorscheme и название цветовой темы
# похуй какое название просто введи и нажми enter и забей на варнинг и потому просто выйди из micro перезгрузи пк
