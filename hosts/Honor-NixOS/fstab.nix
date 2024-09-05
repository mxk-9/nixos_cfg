{
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

}
