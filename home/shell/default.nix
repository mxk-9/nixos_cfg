{ pkgs, ... }:
let
  cutYoutubeVideo = pkgs.writeShellScriptBin "cut_yt" ''
    PATH=$PATH:${pkgs.ffmpeg_7-full}/bin:${pkgs.python312Packages.yt-dlp}/bin
    if [ ''${#@} -eq 0 ]; then
      echo "cut_yt <from> <to> <link>"
      exit
    fi

    yt-dlp --external-downloader ffmpeg --external-downloader-args "ffmpeg_i: -ss $1 -to $2" $3
  '';

  ffmpegReduceQuality = pkgs.writeShellScriptBin "ffreq" ''
    PATH=$PATH:${pkgs.ffmpeg_7-full}/bin
    if [ ''${#@} -eq 0 ]; then
      echo "ffreq <input_filename> <output_filename>"
      exit
    fi

    ffmpeg -i $1 -crf 35 -vcodec libx265 -vf fps=25,scale=-1:720 -ac 1 -c:a aac -b:a 96k $2
  '';
in {
  imports = [
    # ./nushell
    ./zsh
    # ./bash
  ];

  # Extra shell scripts
  home.packages = [
    # cutYoutubeVideo
    # ffmpegReduceQuality
  ];
}
