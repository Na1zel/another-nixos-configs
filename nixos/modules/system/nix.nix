{ ... }:

{
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    auto-optimise-store = true;
    keep-outputs = true;
    keep-derivations = true;
  };

  programs.nh.enable = true;

  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
  };
}
