{ pkgs, ... }: let
  fstab = {
		fileSystems."/" =
			{ device = "/dev/sda1";
				fsType = "ext4";
			};
	
		fileSystems."/home" =
			{ device = "/dev/sdb1";
				fsType = "ext4";
			};
	
		swapDevices = [ { device = "/swapfile"; } ];
	};
in {
	boot = {
		loader = {
			grub = {
				enable      = true;
				device      = "/dev/sda";
				useOSProber = true;
				efiSupport  = false;
			};
		};

		initrd = {
			availableKernelModules = [ "uhci_hcd" "ehci_pci" "ata_piix" "xhci_pci" "ahci" "pata_jmicron" "firewire_ohci" "usbhid" "usb_storage" "floppy" "sd_mod" "sr_mod" ];
		};

		kernelModules = [ "kvm-intel" ];
		kernelParams = [ "quiet" ];
		kernelPackages = pkgs.linuxPackages_xanmod_latest;

		supportedFilesystems = [ "ntfs" ];
	};

  imports = [
    fstab
  ];
}
