{ pkgs, ... }: {
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
}
