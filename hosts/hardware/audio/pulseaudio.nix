{ config, pkgs, ... }:
{
  hardware = {
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
  };

  nixpkgs.config.pulseaudio = true;
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}
