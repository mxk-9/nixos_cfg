{ pkgs, lib, ... }:
{
  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome;
    # luaModules = with pkgs.luaPackages; [
    #   vicious
    #   cjson
    # ];
  };

  xdg.configFile = {
    "awesome" = {
      enable = true;
      recursive = true;
      # source = pkgs.fetchFromGitHub {
      #   owner = "mxk-9";
      #   repo = "awesome-wm";
      #   rev = "80a2841";
      #   sha256 = "gPUrMRqLnvnJLYSAYrNLr1zJrPG011fwqQN0AebZtD0=";
      #   # sha256 = lib.fakeSha256;
      # };
      source = /home/sny/sandbox/awesome-wm;
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
