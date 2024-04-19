$env.config = {
	show_banner: false,
	table: {
		mode: heavy
	}
}

$env.PATH = ($env.PATH | split row (char esep) | append ([$nu.home-path .local bin] | path join) | append ([$nu.home-path go bin] | path join))

def mkd [] {
	# add normal formatting
	let curr_date = (date now | date to-table)
	let year = ($curr_date.year).0
	let month = ($curr_date.month).0
	let day = ($curr_date.day).0
	mkdir $"($year)-($month)-($day)"
}

def gv [...files: string] {
	pueue add gwenview ...$files
}

def ud [block_device: string, --mount (-m), --unmount (-u)] {
	if ($mount and $unmount) {
		print "You cannot use keys --mount and --unmount at the same time"
		return 1
	}

	if ($mount) { udisksctl mount -b $block_device }
	if ($unmount) { udisksctl unmount -b $block_device }
}

def e [...params: string] {
	mut args = ""

	for $i in $params {
		$args = $"($args) ($i)"
	}
	nu -c $"($env.EDITOR) ($args)"
}

def es [session: string] {
	nu -c $"nvim -S ($session)"
}

def nix-cfg [] {
	cd /home/sny/nixos-cfg
		nu -c $"($env.EDITOR) ./"
}

def nix-full-gc [] {
	ls /nix/var/nix/profiles/*link | drop 1 | each { |x| doas rm -v $x.name }
	ls /home/sny/.local/state/nix/profiles/home-manager-*-link | drop 1 | each { |x| rm -v $x.name }

	nix store gc -v
	doas nix-collect-garbage -d -vvvvv
}
