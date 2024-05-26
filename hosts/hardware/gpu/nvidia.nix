{ pkgs, config, ... }:
{
  # nixpkgs.config.cudaSupport = true;

  hardware = {
    opengl = {
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  # services.xserver.videoDrivers = [ "nvidia" ];
  services.xserver.videoDrivers = [ "nvidia" "intel" ];
  environment.systemPackages = [ pkgs.nvtopPackages.nvidia ];
}
