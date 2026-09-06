{ pkgs, ... }:

{
  console = {
    font = "ter-v16b";

    keyMap = "ruwin_alt_sh-UTF-8";

    packages = [
      pkgs.terminus_font
    ];

    earlySetup = true;
  };
}
