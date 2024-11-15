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
      source = pkgs.fetchFromGitHub {
        owner = "mxk-9";
        repo = "awesome-wm";
        rev = "4704049";
        sha256 = "wht2pusDhNct6hoxAPzt3IrB/fbkwoav7Px6uB8yGyk=";
        # sha256 = lib.fakeSha256;
      };
      # source = /home/sny/sandbox/awesome-wm;
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
