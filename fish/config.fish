export EDITOR=nvim
export BROWSER=firefox

export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway
export GTK_THEME=Nordic
export QT_QPA_PLATFORM=wayland-egl
export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export CHROME_EXECUTABLE=(which chromium)

alias fm="ranger"
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gdca="git diff --staged"

source ~/.asdf/asdf.fish

set -U fish_user_paths ~/.local/bin $fish_user_paths

set TTY1 (tty)
if test -z "$DISPLAY"; and test $TTY1 = "/dev/tty1"
  set -x (gnome-keyring-daemon --start | string split "=")
  exec sway
end
