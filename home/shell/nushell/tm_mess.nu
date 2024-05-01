def tmv [] {
	let sessions = (tmux list-sessions | split row "\n" | each {|x| ($x | split row ":").0})

	return $sessions
}

def tm [
	profile: string
	--new_session (-n): string
] {
	let sessions = tmv

	if ($new_session == null) {
		tmux attach -t $profile
	} else {
		mut cmd = $"tmux new-session -s ($profile)"
		if ($new_session != "") {
			$cmd = $cmd + $" -c ($new_session)"
		} else {
			$cmd = $cmd + $" -c ($env.HOME)"
		}
		nu -c $cmd
	}
}

alias tmh = tm home
