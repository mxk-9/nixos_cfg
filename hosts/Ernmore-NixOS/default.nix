{ lib, ... }:
{
  networking.hostName = "Ernmore-NixOS";

  imports = [
    ../hardware
    ../hardware/gpu/intel.nix
    ../hardware/gpu/nvidia.nix
    ./boot.nix
    ./fstab.nix
    ../common
    ../pkg
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  services.getty.autologinUser = "sny"; # because of NVIDIA(black screen in tty)
}
