{ pkgs, lib, _prefs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
  xdg.configFile = {
    nvim.source = ./.;
    # "nvim/lua/sysinfo.lua".text = "return " + lib.generators.toLua { } _prefs;
  };

  home.packages = with pkgs; [
    ripgrep
    nixd
    nixdoc
    jsonnet-language-server

    lua-language-server
    lua51Packages.lua-lsp
    lua
  ];
}
