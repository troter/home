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
alias -g W="w3m -T text/html"
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

alias ag="ag --pager=\$PAGER"
alias s="svn"
alias srevertall="svn revert --depth infinity"
alias g="git"
alias gs="git svn"
alias h="hg"
alias c="cheat" # gem install cheat
alias p="percol"

# update commands
case "${OSTYPE}" in
  darwin*)
    alias updateports="sudo port selfupdate; sudo port outdated"
    alias portupgrade="sudo port upgrade installed"
    alias portsearch="sudo port search"
    ;;
esac

# editor
alias ec="emacsclient"
