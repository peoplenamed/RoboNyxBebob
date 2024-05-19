{
#  boot.initrd.luks.devices."enc".device = "/dev/disk/by-uuid/82144284-cf1d-4d65-9999-2e7cdc3c75d4";

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/a003918f-97a3-4f24-a4b7-9748e70cadd3";
      fsType = "ext4";
      options = ["subvol=root"];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/a003918f-97a3-4f24-a4b7-9748e70cadd3";
      fsType = "ext4";
      options = ["subvol=home"];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/a003918f-97a3-4f24-a4b7-9748e70cadd3";
      fsType = "ext4";
      options = ["subvol=nix"];
    };

    "/persist" = {
      device = "/dev/disk/by-uuid/a003918f-97a3-4f24-a4b7-9748e70cadd3";
      fsType = "ext4";
      options = ["subvol=persist"];
      neededForBoot = true;
    };

    "/var/log" = {
      device = "/dev/disk/by-uuid/a003918f-97a3-4f24-a4b7-9748e70cadd3";
      fsType = "ext4";
      options = ["subvol=log"];
      neededForBoot = true;
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/EE3C-90D2";
      fsType = "vfat";
    };
  };

#  swapDevices = [
#    {device = "/dev/disk/by-uuid/0d1fc824-623b-4bb8-bf7b-63a3e657889d";}
#  ];
}
