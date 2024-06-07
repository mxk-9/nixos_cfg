{ pkgs, inputs, ... }:
# Move cursor to the end of file
let
  android_setup = {
    programs.adb.enable = true;
    users.users.sny.extraGroups = [ "adbusers" ];
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

  sys_utils = {
    environment.systemPackages = with pkgs; [
      tmux neovim
      fd rsync tree
      git wget curl
      bat file
      p7zip unzip rar unrar
      htop hwinfo inxi
      psmisc pciutils hdparm
    ];

  };

  steam_setup = {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  mpv_setup = {
    environment.systemPackages = with pkgs; [ mpv ];
    nixpkgs.overlays = [
      (self: super: {
        mpv = super.mpv.override {
          scripts = with self.mpvScripts ; [
            quality-menu mpris sponsorblock mpv-playlistmanager
          ];
        };
      })
    ];
  };

  user_sny = {
    users.users.sny = {
      isNormalUser = true;
      home = "/home/sny";
      description = "Sny Spyper";
      extraGroups = [ "video" "audio" "networkmanager" "disk" ];
    };

    users.users.sny.shell = pkgs.zsh;
    programs.zsh.enable = true;
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
    };
  };

  nixpkgs.config.allowUnfree = true;
  documentation.dev.enable = true;
  environment.systemPackages = with pkgs; [
    man-pages
    man-pages-posix
  ];

  imports = [
    android_setup
    ./x11.nix
    ./security.nix
    locale
    sys_utils
    steam_setup
    mpv_setup
    user_sny
    inputs.home-manager.nixosModule
  ];

  system.stateVersion = "24.05";
}
