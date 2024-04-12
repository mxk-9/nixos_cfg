{
	networking.hostName = "Honor-NixOS";

	imports = [
		../../hardware/gpu/intel.nix
		./boot.nix
		./fstab.nix
	];
}
