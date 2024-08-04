{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [ dosbox-staging ];
    file."dosbox-staging.conf" = {
      enable = true;
      recursive = true;
      target = ".config/dosbox/dosbox-staging.conf";
      source = ./dosbox.conf;
    };
  };
}
