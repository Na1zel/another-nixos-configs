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
    };

    wireless.iwd.enable = true;

    nftables.enable = true;
  };
}
