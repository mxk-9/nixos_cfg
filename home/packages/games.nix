{ pkgs, ... }:
let
  minecraft = {
    programs.java.enable = true;
    home.packages = [ pkgs.prismlauncher ];
  };

  wine = {
    home.packages = with pkgs; [
      wineWowPackages.stableFull
      wineWowPackages.fonts
      winetricks
      lutris
    ];
  };

  dosbox = {
    home = {
      packages = with pkgs; [ dosbox-staging ];
      file."dosbox-staging.conf" = {
        enable = true;
        recursive = true;
        target = ".config/dosbox/dosbox-staging.conf";
        source = ./dosbox.conf;
      };
    };
  };

  df = {
    home.packages = with pkgs; [
      dwarf-fortress
    ];

    xdg.desktopEntries.df = {
      name = "Dwarf Fortress";
      genericName = "Game";
      exec = "dwarf-fortress";
      terminal = false;
      icon = ../../assets/dwarf_fortress.png;
      categories = [ "Game" ];
    };
  };


in {
  home.packages = with pkgs; [
    duckstation
    pcsx2
    flycast
    # minetest
    # rpcs3
    # openmw
    # srb2
    # xonotic
    # (pkgs.callPackage 
    #   /home/sny/sandbox/VoxelEngine-Cpp/default.nix {
    #   inherit pkgs;
    #   fetchurl = builtins.fetchurl;
    #   }
    # )
  ];

  imports = [
    minecraft
    wine
    # df
    # dosbox
  ];
}
