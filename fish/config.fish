export EDITOR=nvim
export BROWSER=firefox
export OPENER=xdg-open
export CHROME_EXECUTABLE=(which chromium)
export BACKUP_DIR=/run/media/robert/external-drive/home/robert
export GPG_TTY=$(tty)
export MOZ_ENABLE_WAYLAND=1
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh

function yy
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

if status is-login
  exec sway
end

if status is-interactive
  zoxide init fish | source
end

alias gst="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gs="git stage"
alias gc="git commit"
alias dr="sudo systemctl restart docker.service"
alias backup_local_drive="rsync -avP --stats --exclude-from=/home/robert/.config/rsync/rsync-homedir-local.txt --exclude=node_modules --exclude=.yarn/unplugged /home/robert/ $BACKUP_DIR"
alias createkh='set tmp_script (mktemp); curl -sSL -o "{tmp_script}" https://raw.githubusercontent.com/kube-hetzner/terraform-hcloud-kube-hetzner/master/scripts/create.sh; chmod +x "{tmp_script}"; bash "{tmp_script}"; rm "{tmp_script}"'

source /opt/asdf-vm/asdf.fish
fish_add_path ~/.cargo/bin
fish_add_path "$(gem env user_gemhome)/bin"
