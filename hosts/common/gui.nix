{ pkgs, ... }: let
  fonts = {
    fonts.packages = with pkgs; [
      noto-fonts
      noto-fonts-extra
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
      # vistafonts
      # vistafonts-chs
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

  kde = {
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
  };

  gnome = {
  	services.xserver = {
  	  enable = true;
  	  displayManager.gdm.enable = true;
  	  desktopManager.gnome.enable = true;
  	};
  	
  	environment.gnome.excludePackages = (with pkgs; [
  	  gnome-photos
  	  gnome-tour
  	  epiphany
  	  tali
  	  totem
  	  iagno
  	  hitori
  	  atomix
  	]);
  };

  sway = {
    security = {
  	  polkit.enable = true; # for sway
  	  pam.services.swaylock = {};
  	};
  };
in {
  imports = [
    wm_base
    x11_setup
    fonts
    # kde
    # gnome
    # sway
  ];
}
