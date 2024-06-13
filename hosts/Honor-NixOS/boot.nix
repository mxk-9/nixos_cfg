{ pkgs, ... }: {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable      = true;
        efiSupport  = true;
        device      = "nodev";
        useOSProber = true;
        extraEntries = ''
          menuentry "FreeBSD" --class freebsd --class bsd --class os {
            insmod ufs2
            set root=(hd0,gpt4)
            chainloader /boot/loader.efi
          }
        '';
      };
    };

    initrd = {
      availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usb_storage" "sd_mod" ];
    };

    kernelModules = [ "kvm-intel" "uhid" ];
    kernelParams = [ "quiet" ];
    kernelPackages = pkgs.linuxPackages_xanmod_latest;

    supportedFilesystems = [ "ntfs" ];
    extraModprobeConfig = ''
      options bluetooth disable_ertm=1
    '';
  };

}
