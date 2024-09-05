{ pkgs, ... }: let
  android_setup = {
    programs.adb.enable = true;
    users.users.sny.extraGroups = [ "adbusers" ];
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

  sys_utils = with pkgs; [
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

in {
  imports = [
    android_setup
    steam_setup
    mpv_setup
  ];

  environment.systemPackages = sys_utils;
}
