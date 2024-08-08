{ pkgs, inputs, ... }:
# Move cursor to the end of file
let
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
    ./x11.nix
    # ./kde.nix
    ./security.nix
    ./pkg.nix
    locale
    user_sny
    inputs.home-manager.nixosModule
  ];

  system.stateVersion = "24.05";
}
