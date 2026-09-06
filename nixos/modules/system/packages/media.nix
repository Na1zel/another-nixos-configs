{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [

    # Playback
    mpv haruna playerctl cava

    # Download / convert
    yt-dlp ffmpeg imagemagick

  ];
}
