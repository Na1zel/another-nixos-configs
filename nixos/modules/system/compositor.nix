{ pkgs, ... }:
{
  services.desktopManager.plasma6.enable = true;
  services.displayManager.ly.enable = true;
}

# balooctl6 disable # вырубает его нахуй
# balooctl6 purge # чистить базу данных которую balooctl6 создал
# balooctl6 enable # включает его
# balooctl6 status # зачекать статус
# да и ваще надо бы генту ставить а то компиляция сама себя не накомпилирует и не оптимизирует


