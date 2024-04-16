def tm [
	--profile (-p): string
	--attach (-a)
	--new (-n)
	--list_all (-l)
	--list_active (-v)
] {
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

alias tml = tm -l
alias tmv = tm -v
