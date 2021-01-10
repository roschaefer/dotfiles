export EDITOR=nvim
export BROWSER=firefox

export MOZ_ENABLE_WAYLAND=1
export XDG_CURRENT_DESKTOP=sway

alias fm="ranger"
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gdca="git diff --staged"

source ~/.asdf/asdf.fish


if status is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec sway
    end
end
