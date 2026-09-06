{ ... }:

{
  services.logind.settings.Login = {
    IdleAction = "ignore";
  };

  systemd.targets.hibernate.enable = false; # убери если есть swap + zram
  systemd.targets.hybrid-sleep.enable = false; # убери если есть swap + zram
  systemd.targets.suspend.enable = false; # убери если есть swap + zram
}
