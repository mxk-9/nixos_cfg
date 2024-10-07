{ pkgs, lib, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  xdg.configFile.nvim = {
    # source = pkgs.fetchFromGitHub {
    #     owner = "mxk-9";
    #     repo = "nvim";
    #     rev = "37e565a";
    #     sha256 = "8f4p04D/Yy4mxy6AXftnQgDE8gdEmykYH8SWvA4a1J8=";
    #     # sha256 = lib.fakeSha256;
    # };
    source = /home/sny/sandbox/nvim_cfg;
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
