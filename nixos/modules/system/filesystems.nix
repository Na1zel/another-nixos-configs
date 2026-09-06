{ config, lib, ... }:

{
  fileSystems."/".options = [
    "defaults"
    "noatime"
    "compress=zstd"
  ];

  fileSystems."/nix".options = [
    "defaults"
    "noatime"
    "compress=zstd"
  ];

  fileSystems."/home/naizel/hdd1tb" = {
    device = lib.mkForce "/dev/disk/by-label/hdd1tb";
    fsType = "btrfs";
    options = [
      "defaults"
      "noatime"
      "compress=zstd"
    ];
  };

  fileSystems."/home/naizel/ssd500gb" = {
    device = lib.mkForce "/dev/disk/by-label/ssd500gb";
    fsType = "btrfs";
    options = [
      "defaults"
      "noatime"
      "compress=zstd"
    ];
  };

  services.fstrim = {
    enable = true;
    interval = "weekly";
  };
}

# sudo chown -R $USER:users /home/naizel/ssd500gb # НАПИСАТЬ в терминале когда поставли этот конфиг
# sudo chown -R $USER:users /home/naizel/hdd1tb
# sudo chmod -R 755 /home/naizel/hdd1tb
# sudo chmod -R 755 /home/naizel/ssd500gb
