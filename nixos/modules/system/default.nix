{ ... }:

{
  imports = [
    ./boot.nix
    ./zram.nix
    ./filesystems.nix
    ./logind.nix
    ./networking.nix
    ./nix.nix
    ./locale.nix
    ./gpu.nix
    ./gaming.nix
    ./flatpak-imperative.nix
    ./audio.nix
    ./bluetooth.nix
    ./users.nix
    ./console.nix
    ./fonts.nix
    ./services.nix
    ./firmware.nix
    ./compositor.nix
    ./packages
  ];
}
