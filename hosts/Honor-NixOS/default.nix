{ pkgs, lib, ... }: {
  networking.hostName = "Honor-NixOS";

  imports = [
    ../hardware
    ../hardware/intel.nix
    ./boot.nix
    ../common
    ../common/sny.nix
    # ./virt.nix
  ];

  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
