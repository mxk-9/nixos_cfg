{ pkgs, lib, ... }: let
  distrobox = {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
    };

    environment.systemPackages = [ pkgs.distrobox ];
  };

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
    ../common/rdp.nix
    ./boot.nix
    # ./virt.nix
    fstab
    # distrobox
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
