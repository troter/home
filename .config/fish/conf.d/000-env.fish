# $HOME/.config/omf/before.init.fish

set -x LANG ja_JP.UTF-8

# homebrew
if command -v /opt/homebrew/bin/brew &> /dev/null
  /opt/homebrew/bin/brew shellenv fish | source
end

# for my own tools
set -x PATH $HOME/.local/bin $PATH
set -x MANPATH $HOME/.local/man $HOME/.local/share/man $MANPATH
set -x INFOPATH $HOME/.local/info $INFOPATH

set -x EDITOR vi
