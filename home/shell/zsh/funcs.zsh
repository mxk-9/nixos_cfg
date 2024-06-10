nix-full-gc() {
	sys=$(ls /nix/var/nix/profiles/*link | grep link | cut -f 1 -d ':')
	count=$(echo $sys | wc -l)
	sys=($(echo $sys | head -$(($count - 1))))

	home=$(ls /home/sny/.local/state/nix/profiles/ | grep link | cut -f 1 -d ':')
	count=$(echo $home | wc -l)
	home=($(echo $home | head -$(($count - 1))))

	for i in ${sys[@]}; do
	doas rm -fv $i
	done

	for i in ${home[@]}; do
		rm -fv $i
	done

	nix store gc -v
	doas nix-collect-garbage -d -vvvvv
}

kicat() {
	# Make simple "gallery"
	kitty +kitten icat $@
}

calc() {
  echo $(($@))
}
