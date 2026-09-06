{ pkgs, ... }:

{
  home.packages = with pkgs; [
    basedpyright
    zoxide
    eza
    lazygit
  ];
}
