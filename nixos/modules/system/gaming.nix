{ ... }:

{
  programs.gpu-screen-recorder.enable = true;

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = false;
    dedicatedServer.openFirewall = false;
    gamescopeSession.enable = true;
  };

  hardware.steam-hardware.enable = true;

  programs.gamescope = {
    enable = true;
    capSysNice = true; #закоментируй если хочешь стимдек
  };

  programs.gamemode.enable = true;
}
