{ pkgs, ... }:

{
  # ============================================================
  # OBS Studio
  # ============================================================

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      obs-pipewire-audio-capture
      obs-vkcapture
    ];
  };
}
