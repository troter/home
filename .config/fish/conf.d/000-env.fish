# $HOME/.config/omf/before.init.fish

set -x LANG ja_JP.UTF-8

switch "$TERM"
  case 'xterm*';  set -x TERM xterm-256color;
  case 'kterm*';  set -x TERM kterm-256color;
  case 'rxvt*';   set -x TERM rxvt-256color;
  case 'screen*'; set -x TERM screen-256color;
end

if [ -f /usr/local/bin/brew ]
  set -x PATH /usr/local/bin /usr/local/sbin $PATH
  set -x MANPATH /usr/local/share/man $MANPATH
  set -x INFOPATH /usr/local/share/info $INFOPATH
  set -x LD_LIBRARY_PATH /usr/local/lib $LD_LIBRARY_PATH
end

# for my own tools
set -x PATH $HOME/bin $HOME/local/bin $PATH
set -x MANPATH $HOME/man $HOME/share/man $HOME/local/man $HOME/local/share/man $MANPATH
set -x INFOPATH $HOME/info $HOME/local/info $INFOPATH

set -x EDITOR vi
