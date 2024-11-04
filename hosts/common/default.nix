{ pkgs, pkgs-unstable, inputs, ... }:
let
  sys_utils = {
    environment.systemPackages = with pkgs; [
  	  tmux
  	  neovim
  	
  	  fd
  	  rsync
  	  tree
  	
  	  git
  	
  	  wget
  	  curl
  	
  	  bat
  	  file
  	
  	  p7zip
  	  unzip
  	  rar
  	  unrar
  	
  	  htop
  	  hwinfo
  	  inxi
  	
  	  psmisc
  	  pciutils
  	  hdparm
  	];
  };

  locale = {
    i18n = let
      ru = "ru_RU.UTF-8";
      en = "en_US.UTF-8";
    in {
      defaultLocale = en;
      supportedLocales = [ "${ru}/UTF-8" "${en}/UTF-8" ];
      extraLocaleSettings = {
        LC_ADDRESS = ru;
        LC_IDENTIFICATION = ru;
        LC_MEASUREMENT = ru;
        LC_MONETARY = ru;
        LC_NAME = ru;
        LC_NUMERIC = ru;
        LC_PAPER = ru;
        LC_TELEPHONE = ru;
        LC_TIME = ru;
        LC_MESSAGES = en;
      }; 
    };

    console = {
      earlySetup = true;
      font = "ter-v24n";
      packages = [ pkgs.terminus_font ];
      useXkbConfig = true; # use xkbOptions in tty.
    };
  };
in {
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };

    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
    registry = {
      n.flake = inputs.nixpkgs;
      nu.flake = inputs.nixpkgs-unstable;
    };
  };

  nixpkgs.config.allowUnfree = true;

  documentation.dev.enable = true;
  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
  ];

  imports = [
    ./gui.nix
    ./sny.nix
    locale
    sys_utils
    inputs.home-manager.nixosModule
  ];

  system.stateVersion = "24.05";
}
