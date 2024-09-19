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
        rev = "1b12052";
        sha256 = "oiyk8RjVkYrbqMoNS7DM8iuw29iVP+bnflNRynOraCc=";
        # sha256 = lib.fakeSha256;
      };
      # source = /home/sny/sandbox/awesome_cfg;
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
