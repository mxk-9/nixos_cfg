{ pkgs, ... }:
{
  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome;
    luaModules = with pkgs.luaPackages; [
      vicious
      cjson
    ];
  };

  xdg.configFile = {
    "awesome" = {
      enable = true;
      recursive = true;
      source = ./.;
      target = "awesome";
    };

    "picom" = {
      enable = true;
      recursive = true;
      source = ./picom.conf;
      target = "picom/picom.conf";
    };
  };

  home = {
    packages = with pkgs; [
      scrot
      i3lock-color
    ];
    file.".xinitrc".text = ''
      exec dbus-launch --exit-with-session --sh-syntax awesome
      '';
  };
}
