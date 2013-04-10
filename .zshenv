# -*- mode:sh -*-
# user generic .zshenv file for zsh(1).
# =====================================

# LANG.
# =====
export LANG=ja_JP.UTF-8

# TERM.
# =====
if [[ "$TERM" == (xterm*) ]] { TERM=xterm-color; }
if [[ "$TERM" == (kterm*) ]] { TERM=kterm-color; }
if [[ "$TERM" == (rxvt*)  ]] { TERM=rxvt-color;  }
#if [[ "${OSTYPE}" == (cygwin*) ]] { TERM=cygwin;  }
export TERM

# PATH, MANPATH, INFOPATH, LD_LIBRARY_PATH.
# =========================================
# for MacPorts
[ -d "/opt/local/bin"        ] && MANPATH="/opt/local/bin:$PATH"
[ -d "/opt/local/sbin"       ] && MANPATH="/opt/local/sbin:$PATH"
[ -d "/opt/local/share/man"  ] && MANPATH="/opt/local/share/man:$MANPATH"
[ -d "/opt/local/share/info" ] && INFOPATH="/opt/local/share/info:$INFOPATH"
[ -d "/opt/local/lib"        ] && LD_LIBRARY_PATH="/opt/local/lib:$LD_LIBRARY_PATH"

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

# PYTHONSTARTUP
# =============
export PYTHONSTARTUP=$HOME/.pythonstartup

# __END__
