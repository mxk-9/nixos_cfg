{ lib, ... }:
{
  networking.hostName = "Ernmore-NixOS";

  imports = [
    ../hardware
    ../hardware/intel.nix
    ../hardware/nvidia.nix
    ./boot.nix
    ../common
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "performance";
  # services.getty.autologinUser = "sny"; # because of NVIDIA(black screen in tty)
}
