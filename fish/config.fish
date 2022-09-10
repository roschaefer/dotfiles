export EDITOR=nvim
export BROWSER=firefox

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export CHROME_EXECUTABLE=(which chromium)
export BACKUP_DIR=/run/media/robert/external-drive/home/robert

alias fm="ranger"
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gdca="git diff --staged"

alias backup_local_drive="rsync -avP --stats --exclude-from=/home/robert/.config/rsync/rsync-homedir-local.txt /home/robert/ $BACKUP_DIR"

source /opt/asdf-vm/asdf.fish

function mark_prompt_start --on-event fish_prompt
    echo -en "\e]133;A\e\\"
end

set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
  set -x (gnome-keyring-daemon --start | string split "=")
  exec sway
end
