{ lib, ... }:
{
	networking.hostName = "Ernmore-NixOS";

	imports = let
	in [
		../hardware
		../hardware/gpu/intel.nix
		../hardware/gpu/nvidia.nix
		./boot.nix
		./fstab.nix
	];

	powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
	services.getty.autologinUser = "sny"; # because of NVIDIA(black screen in tty)
}
