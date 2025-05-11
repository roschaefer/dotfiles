export EDITOR=nvim
export BROWSER=firefox
export OPENER=xdg-open
export CHROME_EXECUTABLE=(which chromium)
export BACKUP_DIR=/run/media/robert/external-drive/home/robert
export GPG_TTY=$(tty)
export MOZ_ENABLE_WAYLAND=1
export SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/gcr/ssh
export XDG_CURRENT_DESKTOP=sway
export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock

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

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

alias gst="git status"
alias gd="git diff"
alias gds="git diff --staged"
alias gs="git stage"
alias gc="git commit"
alias lg="lazygit"
alias dr="sudo systemctl restart docker.service"
alias backup_local_drive="rsync -avP --stats --exclude-from=/home/robert/.config/rsync/rsync-homedir-local.txt --exclude=node_modules --exclude=.yarn/unplugged /home/robert/ $BACKUP_DIR"
alias createkh='set tmp_script (mktemp); curl -sSL -o "{tmp_script}" https://raw.githubusercontent.com/kube-hetzner/terraform-hcloud-kube-hetzner/master/scripts/create.sh; chmod +x "{tmp_script}"; bash "{tmp_script}"; rm "{tmp_script}"'
