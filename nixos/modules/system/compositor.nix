{ pkgs, ... }:
{
  programs.labwc.enable = true;
  services.displayManager.ly.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-wlr xdg-desktop-portal-gtk ];
    config.labwc.default = [ "wlr" "gtk" ];
  };
}

# balooctl6 disable # вырубает его нахуй
# balooctl6 purge # чистить базу данных которую balooctl6 создал
# balooctl6 enable # включает его
# balooctl6 status # зачекать статус
# да и ваще надо бы генту ставить а то компиляция сама себя не накомпилирует и не оптимизирует


