export EDITOR=nvim
export BROWSER=firefox
export CHROME_EXECUTABLE=(which chromium)
export BACKUP_DIR=/run/media/robert/external-drive/home/robert
export GPG_TTY=$(tty)

source /opt/asdf-vm/asdf.fish

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

# pnpm
set -gx PNPM_HOME "/home/robert/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

alias gl="git pull"
alias gf="git fetch"
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gdca="git diff --staged"
alias lf="lfcd"
alias backup_local_drive="rsync -avP --stats --exclude-from=/home/robert/.config/rsync/rsync-homedir-local.txt --exclude=node_modules --exclude=.yarn/unplugged --exclude='*.CR3' /home/robert/ $BACKUP_DIR"

if status is-login
  set -x (gnome-keyring-daemon | string split "=")
  exec sway
end

if status is-interactive
  # direnv hook fish | source
  zoxide init fish | source
end
