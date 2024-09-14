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

  rdp = {
    environment.systemPackages = [ pkgs.freerdp ];

    security.pki.certificates = [
      "${builtins.readFile /home/sny/.local/certs/sl_i.crt}"
      "${builtins.readFile /home/sny/.local/certs/sl_r.crt}"
    ];

    home-manager.users.sny.xdg.desktopEntries.rdp_win = {
      name = "RDP Windows";
      genericName = "Work";
      type = "Application";
      exec = "${pkgs.kitty}/bin/kitty --hold zsh -c /home/sny/sandbox/work_sandbox/launch.sh";
      icon = ./freerdp.png;
      categories = [ "Office" ];
    };
  };

in {
  networking.hostName = "Honor-NixOS";

  imports = [
    ../hardware
    ../hardware/intel.nix
    ../common
    ./boot.nix
    # ./virt.nix
    fstab
    rdp
    # distrobox
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
