nix-full-gc() {
    # sys=$(ls /nix/var/nix/profiles/*link | grep link | cut -f 1 -d ':')
    # count=$(echo $sys | wc -l)
    # sys=($(echo $sys | head -$(($count - 1))))

    # home=$(ls /home/sny/.local/state/nix/profiles/ | grep link | cut -f 1 -d ':')
    # count=$(echo $home | wc -l)
    # home=($(echo $home | head -$(($count - 1))))

    # for i in ${sys[@]}; do
    #     doas rm -fv $i
    # done

    # for i in ${home[@]}; do
    #     rm -fv $i
    # done

    # nix store gc -v
    # doas nix-collect-garbage -d -vvvvv

    echo REWRITE ME!
}

kicat() {
    # Make simple "gallery"
    kitty +kitten icat $@
}

calc() {
  echo $(($@))
}

ffsrec() {
    # accept keys to customize these settings
    FNAME=$(date +%Y_%m_%d-%H_%M_%S)
    VSIZE="1920x1080"
    MONITOR="1920,0" # external
    # MONITOR="0,0" # internal
    RATE="60"

    ffmpeg \
        -video_size $VSIZE \
        -framerate $RATE \
        -f x11grab \
        -i :0.0+$MONITOR \
        "$FNAME"_pre.mp4 | \
    pw-record \
        -P '{ stream.capture.sink=true }' \
        "$FNAME"_pre.mp3

    ffmpeg -i "$FNAME"_pre.mp4 -i "$FNAME"_pre.mp3 -acodec copy -vcodec copy $FNAME.mp4
    rm "$FNAME"_pre.mp4 "$FNAME"_pre.mp3
}

nrn() {
    pkg=$1
    shift
    nix run nixpkgs#$pkg $@
}

nsc() {
  pkg=$1
  shift
  nix shell nixpkgs#$pkg --command $@
}

mkcd() {
    mkdir -p $1 && cd $1
}

nd-emacs() {
    if [ ${#@} -eq 0 ]; then
        echo "nd-emacs <daemon_name>"
        exit
    fi
    nix develop --command emacs --daemon=$1 && emacsclient -nc --socket=$1
    echo You can close terminal now
}
