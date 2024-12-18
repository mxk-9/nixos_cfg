{ config, lib, modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./bluetooth.nix
    ./audio.nix
    ./net.nix
  ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware = {
    enableAllFirmware = true;
    xpadneo.enable = true;
  };
}
