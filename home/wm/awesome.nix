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
        rev = "533f4d1";
        sha256 = "uX7W6eNK4KQfNfiDXwL+p6vC0VkHk+mnLmqEFpLUkNQ=";
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
