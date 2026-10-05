{ ... }:
{
  programs.swaylock = {
    enable = true;
    settings = {
      color = "000000";
      inside-color = "000000";
      ring-color = "005577";
      key-hl-color = "eeeeee";
      line-color = "00000000";
      separator-color = "00000000";
      inside-ver-color = "000000";
      ring-ver-color = "005577";
      inside-wrong-color = "000000";
      ring-wrong-color = "aa3333";
      indicator-radius = 80;
      ignore-empty-password = true;
      show-failed-attempts = true;
      show-keyboard-layout = true;
    };
  };
}
