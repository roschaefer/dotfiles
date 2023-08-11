export EDITOR=nvim
export BROWSER=firefox

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export CHROME_EXECUTABLE=(which chromium)
export BACKUP_DIR=/run/media/robert/external-drive/home/robert
export GPG_TTY=$(tty)

alias fm="vifm"
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gdca="git diff --staged"
alias backup_local_drive="rsync -avP --stats --exclude-from=/home/robert/.config/rsync/rsync-homedir-local.txt --exclude=node_modules --exclude=.yarn/unplugged --exclude='*.CR3' /home/robert/ $BACKUP_DIR"

if status is-login
  set -x (gnome-keyring-daemon | string split "=")
  exec sway
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

source /opt/asdf-vm/asdf.fish

direnv hook fish | source

if type -q theme.sh
	if test -e ~/.theme_history
	theme.sh (theme.sh -l|tail -n1)
	end

	# Optional
	# Bind C-o to the last theme.
	function last_theme
		theme.sh (theme.sh -l|tail -n2|head -n1)
	end

	bind \co last_theme

	alias th='theme.sh -i'

	# Interactively load a light theme
	alias thl='theme.sh --light -i'

	# Interactively load a dark theme
	alias thd='theme.sh --dark -i'
end
