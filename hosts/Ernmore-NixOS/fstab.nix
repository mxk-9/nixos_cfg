{
	fileSystems."/" =
		{ device = "/dev/sda1";
			fsType = "ext4";
		};

	fileSystems."/home" =
		{ device = "/dev/sdb1";
			fsType = "ext4";
		};

	swapDevices = [ { device = "/swapfile"; } ];
}
