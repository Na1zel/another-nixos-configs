{ ... }:

{
  networking = {
    hostName = "nixos";

    networkmanager = {
      enable = true;

      wifi = {
        backend = "iwd";
        powersave = false;
      };
      settings = {
      	device."wifi.iwd.autoconnect" = false;
      };
    };

    wireless.iwd.enable = true;

    nftables.enable = true;
  };
}
