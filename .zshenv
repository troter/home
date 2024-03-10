# -*- mode:sh -*-
# user generic .zshenv file for zsh(1).
# =====================================

# LANG.
# =====
export LANG=ja_JP.UTF-8

# TERM.
# =====
[[ "$TERM" == (xterm*)   ]] && TERM=xterm-256color
[[ "$TERM" == (kterm*)   ]] && TERM=kterm-256color
[[ "$TERM" == (rxvt*)    ]] && TERM=rxvt-256color
[[ "$TERM" == (screen*)  ]] && TERM=screen-256color
#if [[ "${OSTYPE}" == (cygwin*) ]] { TERM=cygwin;  }
export TERM

# PATH, MANPATH, INFOPATH, LD_LIBRARY_PATH.
# =========================================
# for Homebrew
if [ -f "/usr/local/bin/brew" ]; then
  [ -d "/usr/local/bin"        ] && PATH="/usr/local/bin:$PATH"
  [ -d "/usr/local/sbin"       ] && PATH="/usr/local/sbin:$PATH"
  [ -d "/usr/local/share/man"  ] && MANPATH="/usr/local/share/man:$MANPATH"
  [ -d "/usr/local/share/info" ] && INFOPATH="/usr/local/share/info:$INFOPATH"
  [ -d "/usr/local/lib"        ] && LD_LIBRARY_PATH="/usr/local/lib:$LD_LIBRARY_PATH"
fi

# for MacPorts
[ -d "/opt/local/bin"        ] && PATH="/opt/local/bin:$PATH"
[ -d "/opt/local/sbin"       ] && PATH="/opt/local/sbin:$PATH"
[ -d "/opt/local/share/man"  ] && MANPATH="/opt/local/share/man:$MANPATH"
[ -d "/opt/local/share/info" ] && INFOPATH="/opt/local/share/info:$INFOPATH"
[ -d "/opt/local/lib"        ] && LD_LIBRARY_PATH="/opt/local/lib:$LD_LIBRARY_PATH"

# for specific tools
[ -d "$HOME/.local/bin"       ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.local/man"       ] && MANPATH="$HOME/.local/man:$MANPATH"
[ -d "$HOME/.local/share/man" ] && MANPATH="$HOME/.local/share/man:$MANPATH"
[ -d "$HOME/.local/info"      ] && INFOPATH="$HOME/.local/info:$INFOPATH"

export PATH MANPATH INFOPATH LD_LIBRARY_PATH

# __END__
