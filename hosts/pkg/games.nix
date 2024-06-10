{ pkgs, ... }: let
  steam_setup = {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };
  

  minecraft = {
    programs.java.enable = true;
    environment.systemPackages = [ pkgs.prismlauncher ];
  };
  

  wine_setup = {
    environment.systemPackages = with pkgs; [
      wineWowPackages.stableFull
      wineWowPackages.fonts
      winetricks
      lutris
    ];
  };
  

in {
  imports = [
    minecraft
    steam_setup
    wine_setup
  ];

}
