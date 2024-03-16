# $HOME/.config/omf/before.init.fish

set -x LANG ja_JP.UTF-8

# for my own tools
set -x PATH $HOME/.local/bin $PATH
set -x MANPATH $HOME/.local/man $HOME/.local/share/man $MANPATH
set -x INFOPATH $HOME/.local/info $INFOPATH

set -x EDITOR vi
