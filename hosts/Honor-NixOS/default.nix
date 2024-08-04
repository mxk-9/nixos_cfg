{ pkgs, lib, ... }: {
  networking.hostName = "Honor-NixOS";

  imports = [
    ../hardware
    ../hardware/gpu/intel.nix
    ./boot.nix
    ./fstab.nix
    ../common
    ../pkg
    # ./virt.nix
  ];
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
