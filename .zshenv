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

# for pipsi
[ -d "$HOME/.local/bin" ] && PATH="$HOME/.local/bin:$PATH"

# for my own tools
[ -d "$HOME/bin"       ] && PATH="$HOME/bin:$PATH"
[ -d "$HOME/man"       ] && MANPATH="$HOME/man:$MANPATH"
[ -d "$HOME/share/man" ] && MANPATH="$HOME/share/man:$MANPATH"
[ -d "$HOME/info"      ] && INFOPATH="$HOME/info:$INFOPATH"

# for src install
[ -d "$HOME/local/bin"       ] && PATH="$HOME/local/bin:$PATH"
[ -d "$HOME/local/man"       ] && MANPATH="$HOME/local/man:$MANPATH"
[ -d "$HOME/local/share/man" ] && MANPATH="$HOME/local/share/man:$MANPATH"
[ -d "$HOME/local/info"      ] && INFOPATH="$HOME/local/info:$INFOPATH"

export PATH MANPATH INFOPATH LD_LIBRARY_PATH

# JAVA_HOME
# =========
if [ -z "$JAVA_HOME" ]; then
  [ -e "/usr/libexec/java_home"    ] && JAVA_HOME=$(/usr/libexec/java_home)
  [ -d "/usr/lib/jvm/java-openjdk" ] && JAVA_HOME=/usr/lib/jvm/java-openjdk
  [ -d "/usr/lib/jvm/open-jdk"     ] && JAVA_HOME=/usr/lib/jvm/open-jdk
  export JAVA_HOME
fi

# __END__
