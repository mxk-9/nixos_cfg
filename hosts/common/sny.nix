{ pkgs, ... }: let
  rdp = {
    environment.systemPackages = with pkgs; [ freerdp ];

    security.pki.certificates = [
      "${builtins.readFile /home/sny/.local/certs/sl_i.crt}"
      "${builtins.readFile /home/sny/.local/certs/sl_r.crt}"
    ];

    home-manager.users.sny.xdg.desktopEntries.rdp_win = {
      name = "RDP Windows";
      genericName = "Work";
      type = "Application";
      exec = "${pkgs.kitty}/bin/kitty /home/sny/sandbox/work_sandbox/launch.sh";
      icon = ../../assets/freerdp.png;
      categories = [ "Office" ];
    };
  };

  doas = {
    security = {
      doas = {
        enable = true;
        extraRules = [
          { users = [ "sny" ]
          ; keepEnv = true
          ; persist = true
          ;}

          { users = [ "sny" ]
          ; runAs = "root"
          ; noPass = true
          ; cmd = "hdparm"
          ;}

          { users = [ "sny" ]
          ; runAs = "root"
          ; noPass = true
          ; cmd = "nixos-rebuild"
          ;}
        ];
      };
      sudo.enable = false;
    };
  };

  android = {
    programs.adb.enable = true;
    users.users.sny.extraGroups = [ "adbusers" ];
  };

  steam_cfg = {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
  };

  mpv_cfg = {
    nixpkgs.overlays = [
      (self: super: {
        mpv = super.mpv.override {
          scripts = with self.mpvScripts; [
            quality-menu mpris sponsorblock mpv-playlistmanager
          ];
        };
      })
    ];

    environment = {
      etc = {
        "mpv/mpv.conf".text = ''
          ytdl-format=bestvideo[height<=?720]+bestaudio/best
        '';

        "mpv/input.conf".text = ''
          F     script-binding quality_menu/video_formats_toggle
          Alt+f script-binding quality_menu/audio_formats_toggle
          r     cycle_values   video-rotate 90 180 270 0
        '';
      };

      systemPackages = [ pkgs.mpv ];
    };
  };

  distrobox_cfg = {
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
   };
  	
    environment.systemPackages = with pkgs; [ distrobox ];
  };
in {
  users.users.sny = {
    isNormalUser = true;
    home = "/home/sny";
    description = "Sny Spyper";
    extraGroups = [ "video" "audio" "networkmanager" "disk" ];
  };

  users.users.sny.shell = pkgs.zsh;
  programs.zsh.enable = true;

  imports = [
    rdp
    distrobox_cfg
    doas
    android
    steam_cfg
    mpv_cfg
  ];
}
