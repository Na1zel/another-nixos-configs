{ ... }:

{
  hardware.enableRedistributableFirmware = true;

  services.fwupd.enable = true;

  hardware.cpu.intel.updateMicrocode = true; # или hardware.cpu.amd.updateMicrocode = true; если AMD
}
