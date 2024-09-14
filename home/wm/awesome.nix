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
        rev = "c327b49";
        sha256 = "PWXtRfOYVfUlILPm4B4jwpiUfiq50P2ns2Me3rJOKlI=";
        # sha256 = lib.fakeSha256;
      };
      # source = /home/sny/sandbox/my_awesome_cfg;
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
