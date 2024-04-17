{ pkgs, config, ... }:
{
  nixpkgs.config.cudaSupport = false;

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false; # maybe should disable
      open = false; # do not use NVIDIA's open source kernel module
      nvidiaSettings = true; # enable GUI nvidia settings
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  # services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.videoDrivers = [ "nvidia" "intel" ];
  environment.systemPackages = [ pkgs.nvtopPackages.nvidia ];
}
