export EDITOR=nvim


alias fm="ranger"
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gd="git diff"
alias gdca="git diff --cached"


# javascript
export PATH="$HOME/.yarn/bin:$PATH"
# export PATH="$HOME/.nodenv/shims:$PATH"

# android
export ANDROID_HOME="/opt/android-sdk"
export PATH="$ANDROID_HOME/platform-tools:$PATH"

# flutter
export PATH="/opt/flutter/bin:$PATH"

# neo4j
export PATH="/usr/share/neo4j/bin/:$PATH"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# kubeconfig files
export KUBECONFIG="$HOME/.kube/config:$HOME/.kube/nitro-staging-kubeconfig.yaml:$HOME/.kube/nitro-production-kubeconfig.yaml"

if status is-login
    if test -z "$DISPLAY" -a $XDG_VTNR = 1
        exec startx -- -keeptty
    end
end
source ~/.asdf/asdf.fish
