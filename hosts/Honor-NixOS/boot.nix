{ pkgs, ... }: let
  freebsdEntry = {
    boot.loader.grub.extraEntries = ''
      menuentry "FreeBSD" --class freebsd --class bsd --class os --unrestricted {
        insmod ufs2
        set root=(hd0,gpt4)
        chainloader /boot/loader.efi
      }
    '';
  };
in {
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable      = true;
        efiSupport  = true;
        device      = "nodev";
        useOSProber = true;

        splashImage = ./grub_background.png;
        splashMode = "normal";
        gfxmodeEfi = "1920x1080";
        gfxpayloadEfi = "keep";

        entryOptions = "--class nixos --unrestricted";
        subEntryOptions = "--class nixos --unrestricted";

        memtest86 = {
          enable = true;
        };

        users = {
          root = {
            hashedPassword = "grub.pbkdf2.sha512.10000.CE723DC96B45BA24F56CF6C07F2F6E67960A1257CEA774877A18F225F12E669858DDD0DA1AB18B2A5AC4AC80D4B7F702803E3DD827F0DE6D468E65A7EEC84EA7.3C685C025DFD95E30D5EC50AAD0FB5D0373A2C3F0115B5DDE733B61087FDA8A0B74289A4A8DA22B1306AA77FBE529003E2C8A2EA44F2C7A0BEAC725130D21778";
          };
        };
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
  imports = [
    # freebsdEntry
  ];

}
