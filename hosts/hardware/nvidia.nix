{ pkgs, config, ... }:
{
  # nixpkgs.config.cudaSupport = true;

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };

    nvidia = {
      modesetting.enable = true;
      nvidiaPersistenced = true;
      powerManagement.enable = false;
      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" "intel" ];
  environment.systemPackages = [ pkgs.nvtopPackages.nvidia ];
}
