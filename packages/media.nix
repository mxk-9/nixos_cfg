{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    playerctl
    mpv
    songrec
    python312Packages.yt-dlp
  ];

  nixpkgs.overlays = [
    (self: super: {
      mpv = super.mpv.override {
        scripts = with self.mpvScripts ; [
          quality-menu mpris sponsorblock mpv-playlistmanager
        ];
      };
    })
  ];
}
