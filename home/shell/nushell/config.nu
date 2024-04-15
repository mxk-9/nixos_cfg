$env.config = {
  show_banner: false,
  table: {
    mode: heavy
  }
}

$env.PATH = ($env.PATH | split row (char esep) | append ([$nu.home-path .local bin] | path join))

def mkd [] {
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

def nix-cfg [] {
  cd /home/sny/nixos-cfg
  nu -c $"($env.EDITOR) ./"
}

def e [params: string] {
	nu -c $"($env.EDITOR) ($params)"
}

def nix-full-gc [] {
  ls /nix/var/nix/profiles/*link | drop 1 | each { |x| doas rm -v $x.name }
  ls /home/sny/.local/state/nix/profiles/home-manager-*-link | drop 1 | each { |x| rm -v $x.name }

  nix store gc -v
  doas nix-collect-garbage -d -vvvvv
}

def tm [--profile (-p): string, --attach (-a), --new (-n), --list_all (-l), --list_active (-v)] {
	let profiles = {
		work : /mnt/windows/Users/sny/WORK/,
		home : /home/sny/,
		learn_go : /home/sny/sandbox/gulag/learn_smth/,
		eshka_go : /home/sny/sandbox/eshka_go/,
	};

	if ($list_all) {
		print $profiles
		return
	}

	if ($list_active) {
		tmux list-sessions
		return
	}

	if ($profile != null) {
		let session_path = ($profiles | get $profile)
		if ($attach) {
			tmux attach -t $profile
		} else if ($new) {
			tmux new-session -s $profile -c $session_path
		}
	}
}

def tma [profile: string] {
	tm -a -p $profile
}

def tmn [profile: string] {
	tm -n -p $profile
}
