export EDITOR=nvim
export BROWSER=firefox
export OPENER=xdg-open
export CHROME_EXECUTABLE=(which chromium)
export BACKUP_DIR=/run/media/robert/external-drive/home/robert
export GPG_TTY=$(tty)
export MOZ_ENABLE_WAYLAND=1

function lfcd
    set tmp (mktemp)
    # `command` is needed in case `lfcd` is aliased to `lf`
    command lf -last-dir-path=$tmp $argv
    if test -f "$tmp"
        set dir (cat $tmp)
        rm -f $tmp
        if test -d "$dir"
            if test "$dir" != (pwd)
                cd $dir
            end
        end
    end
end

if status is-login
  set -x (gnome-keyring-daemon | string split "=")
  exec sway
end

if status is-interactive
  zoxide init fish | source
end

source /opt/asdf-vm/asdf.fish
fish_add_path ~/.cargo/bin
fish_add_path "$(gem env user_gemhome)/bin"

alias gst="git status"
alias lf="lfcd"
alias backup_local_drive="rsync -avP --stats --exclude-from=/home/robert/.config/rsync/rsync-homedir-local.txt --exclude=node_modules --exclude=.yarn/unplugged /home/robert/ $BACKUP_DIR"
