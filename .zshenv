# -*- mode:sh -*-
# user generic .zshenv file for zsh(1).
# =====================================

# ZDOTDIR.
# =====
export ZDOTDIR="${ZDOTDIR:-"$HOME/.config/zsh"}"

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
if [ -f "/opt/homebrew/bin/brew" ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# for specific tools
[ -d "$HOME/.local/bin"       ] && PATH="$HOME/.local/bin:$PATH"
[ -d "$HOME/.local/man"       ] && MANPATH="$HOME/.local/man:$MANPATH"
[ -d "$HOME/.local/share/man" ] && MANPATH="$HOME/.local/share/man:$MANPATH"
[ -d "$HOME/.local/info"      ] && INFOPATH="$HOME/.local/info:$INFOPATH"

export PATH MANPATH INFOPATH LD_LIBRARY_PATH

# __END__
