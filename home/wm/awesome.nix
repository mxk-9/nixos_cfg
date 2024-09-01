{ pkgs, lib, ... }:
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
      source = pkgs.fetchFromGitHub {
        owner = "mxk-9";
        repo = "awesome-wm";
        rev = "8d7c362";
        sha256 = "2OW6g7WtbcD+OWlLn4R7rbOomKt/oug2pIGc/D6aQFo=";
        # sha256 = lib.fakeSha256;
      };
      target = "awesome";
    };
  };

  home = {
    packages = with pkgs; [
      scrot
      i3lock-color
    ];

    file.".xinitrc".text = ''
      exec awesome
    '';
  };
}
