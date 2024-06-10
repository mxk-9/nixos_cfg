{ pkgs, ... }: let
  fonts = {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-extra
      noto-fonts-cjk
      noto-fonts-cjk-sans
      noto-fonts-color-emoji
      noto-fonts-emoji
      liberation_ttf
      fira-code
      fira-code-symbols
      fira-mono
      font-awesome
      jetbrains-mono
      nerdfonts
      mplus-outline-fonts.githubRelease
      dina-font
      proggyfonts
      corefonts
      vistafonts
      vistafonts-chs
    ];
  };

  wm_base = {
    services = {
        power-profiles-daemon.enable = true;
        udisks2.enable = true;
    };

    programs = {
      light.enable = true;
      dconf.enable = true;
    };
  };

  x11_setup = {
    services.xserver = {
      enable = true;
      xkb = {
        options = "grp:caps_toggle,compose:rctrl";
        layout = "us,ru";
      };
      excludePackages = [ pkgs.xterm ];
      wacom.enable = true;
      displayManager.startx.enable = true;
    };
  
    programs.dconf.enable = true;
  
    services.libinput = {
      enable = true;
      mouse.accelProfile = "flat";
      touchpad = {
        accelProfile = "flat";
        clickMethod = "clickfinger";
        tapping = true;
        tappingDragLock = false;
        disableWhileTyping = false;
      };
    };
  };
in {
  imports = [
    wm_base
    x11_setup
    fonts
  ];
}
