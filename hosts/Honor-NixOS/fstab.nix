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

	# fileSystems."/mnt/windows" = {
	# 	device = "/dev/nvme0n1p5";
	# 	fsType = "ntfs";
	# 	options = [ "rw" "exec" "auto" "user" "fmask=0022" "dmask=0000" "uid=1000" "gid=1000" "umask=0022" ];
	# };

	swapDevices = [ { device = "/swapfile"; } ];

}
