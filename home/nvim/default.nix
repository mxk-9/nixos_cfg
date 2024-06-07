{ pkgs, ... }: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };
  xdg.configFile.nvim.source = ./.;
  home.packages = with pkgs; [ ripgrep nixd jsonnet-language-server ];
}
