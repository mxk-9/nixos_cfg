{ pkgs, ... }: {
  server.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    epiphany
    tali
    totem
    iagno
    hitori
    atomix
  ]);
}
