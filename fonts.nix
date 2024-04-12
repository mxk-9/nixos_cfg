{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    liberation_ttf
    fira-code
    fira-code-symbols
    fira-mono
    font-awesome
    jetbrains-mono
    nerdfonts
    mplus-outline-fonts.githubRelease
    dina-font
    proggyfonts
    corefonts
  ];
}
