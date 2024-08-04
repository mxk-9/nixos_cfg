{ pkgs, ... }:
{
  services.xserver.videoDrivers = [ "intel" ];

  boot.kernelParams = [ "i915.force_probe=9b41" ];

  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };

  hardware.graphics = {
    enable = true;
    # driSupport = true;
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
	  libGL
    ];
	# setLdLibraryPath = true;
  };
}
