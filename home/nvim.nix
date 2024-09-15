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
        rev = "a8a1f62";
        sha256 = "Si6cg+iBcwI69Mmhag6onlq5ywjEuL0NdnaujNCaTHs=";
        # sha256 = lib.fakeSha256;
    };
    # source = /home/sny/sandbox/my_nvim_cfg;
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
