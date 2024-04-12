{
	networking.hostName = "Ernmore-NixOS";

	imports = [
		../../hardware/gpu/intel.nix
		../../hardware/gpu/nvidia.nix
		./boot.nix
		./fstab.nix
	];

	services.getty.autologinUser = "sny"; # because of NVIDIA(black screen in tty)
}
