{ pkgs, ... }: {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    # networkSocket = {
    #   enable = true;
    #   openFirewall = true;
    # };
  };

  environment.systemPackages = [ pkgs.distrobox ];
}
