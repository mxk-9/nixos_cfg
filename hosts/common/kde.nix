{ pkgs, ... }:{
  services = {
    displayManager.sddm = {
      enable = true;
    };
    xserver.desktopManager.plasma5.enable = true;
  };

  environment.systemPackages = with pkgs; [
    kate
    kwrited
  ];

  environment.variables = {
    QT_QPA_PLATFORMTHEME = "Oxygen";
  };
}
