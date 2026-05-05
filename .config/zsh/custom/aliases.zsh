# -*- coding: utf-8; mode: sh; -*-
# Alias configuration.
# ====================
# expand aliases before completing
setopt complete_aliases     # aliased ls needs if file/dir completions work

# Global alias.
# -------------
alias -g H="| head"
alias -g T="| tail"
alias -g G="| grep"
alias -g L="| \$PAGER"
alias -g S="| sed"
alias -g A="| awk"
alias -g P="| percol"

# Common alias.
# -------------
alias where="command -v"
alias j="jobs -l"

alias l="ls -F"
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

alias cp="nocorrect cp -i"
alias rm="rm -i"
alias m="make"

alias g="git"

# editor
alias ec="emacsclient"
