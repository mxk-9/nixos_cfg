$env.config = {
	show_banner: false,
	table: {
		mode: heavy
	}
}

$env.PATH = ($env.PATH | split row (char esep) | append ([$nu.home-path .local bin] | path join) | append ([$nu.home-path go bin] | path join))

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
	if $env.EDITOR == "nvim" {
		nu -c $"nvim -S ($session)"
	} else {
		print "This function works only for nvim! (nvim -S <Session.vim>)"
	}
}

def nix-cfg [] {
	cd /home/sny/nixos-cfg
	nu -c $"($env.EDITOR) ./"
}

def nix-full-gc [] {
	ls /nix/var/nix/profiles/*link | get name | drop 1 | each { |x| doas rm -v $x }
	ls /home/sny/.local/state/nix/profiles/home-manager-*-link | get name | drop 1 | each { |x| rm -v $x }

	nix store gc -v
	doas nix-collect-garbage -d -vvvvv
}

def duh [...files: string] {
	for i in $files {
		let data = (du -a $i | get path apparent)
		print $"($data.1.0) : ($data.0.0)"
	}
}

def --env mkcd [path: string] {
	mkdir $path
	cd $path
}
