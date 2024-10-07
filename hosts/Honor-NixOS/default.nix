{ pkgs, lib, ... }: let
  fstab = {
    fileSystems."/" =
      { device = "/dev/nvme0n1p2";
        fsType = "ext4";
      };
  
    fileSystems."/boot" =
      { device = "/dev/nvme0n1p1";
        fsType = "vfat";
      };
  
    fileSystems."/home" =
      { device = "/dev/nvme0n1p3";
        fsType = "ext4";
      };
  
    swapDevices = [ { device = "/swapfile"; } ];
  };

in {
  networking.hostName = "Honor-NixOS";

  imports = [
    ../hardware
    ../hardware/intel.nix
    ../common
    ../common/distrobox.nix
    # ../common/rdp.nix
    # ./virt.nix
    ./boot.nix
    fstab
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
