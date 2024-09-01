{ pkgs, lib, _prefs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
  xdg.configFile = {
    nvim.source = pkgs.fetchFromGitHub {
      owner = "mxk-9";
      repo = "nvim";
      rev = "a8a1f62";
      sha256 = "Si6cg+iBcwI69Mmhag6onlq5ywjEuL0NdnaujNCaTHs=";
      # sha256 = lib.fakeSha256;
    };
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
