{ lib, ... }: {
  networking.hostName = "Honor-NixOS";

  imports = [
    ../hardware
    ../hardware/intel.nix
    ./boot.nix
    ./fstab.nix
    ../common
    ./distrobox.nix
    ./virt.nix
  ];
  powerManagement.cpuFreqGovernor = lib.mkDefault "powersave";
}
