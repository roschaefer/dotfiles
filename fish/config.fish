export EDITOR=nvim
export BROWSER=firefox

export MOZ_ENABLE_WAYLAND=1
export GO111MODULE=auto
export XDG_CURRENT_DESKTOP=sway
export QT_QPA_PLATFORM=wayland-egl
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export CHROME_EXECUTABLE=(which chromium)
export BACKUP_DIR=/run/media/robert/external-drive/home/robert

alias fm="ranger"
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gdca="git diff --staged"

alias backup_local_drive="rsync -avP --exclude-from=/home/robert/.config/rsync/rsync-homedir-local.txt /home/robert/ $BACKUP_DIR"

source ~/.asdf/asdf.fish
. ~/.asdf/plugins/java/set-java-home.fish

set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
  set -x (gnome-keyring-daemon --start | string split "=")
  exec sway ^ $HOME/sway.log
end
