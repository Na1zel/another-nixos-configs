{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    cantarell-fonts
    material-symbols
    rubik
    nerd-fonts.caskaydia-cove
    oxygenfonts 
  ];
}
