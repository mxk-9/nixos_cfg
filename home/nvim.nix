{ pkgs, lib, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  xdg.configFile.nvim = {
    source = pkgs.fetchFromGitHub {
        owner = "mxk-9";
        repo = "nvim";
        rev = "85e5353";
        sha256 = "iqBZkQ8wr/fUvQNdqv2slSTHQHScP1nWSKZls9v+3vQ=";
        # sha256 = lib.fakeSha256;
    };
    # source = /home/sny/sandbox/nvim_cfg;
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
