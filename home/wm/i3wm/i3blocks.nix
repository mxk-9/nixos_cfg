{ pkgs, lib, ... }:
{
  programs.i3blocks = {
    enable = true;
    package = pkgs.i3blocks;
    bars.top = {
      title = {
        interval = "persist";
        command = "xtitle -s";
      };

      time = lib.hm.dag.entryAfter [ "title" ] {
        command = "date +%r";
        interval = 1;
      };

      date = lib.hm.dag.entryAfter [ "time" ] {
        command = "date +%d";
        interval = 60;
      };
    };
  };

  home.packages = with pkgs; [
    xtitle
  ];
}
