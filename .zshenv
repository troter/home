# -*- mode:sh -*-
# user generic .zshenv file for zsh(1).
# =====================================

# ZDOTDIR.
# =====
export ZDOTDIR="${ZDOTDIR:-"$HOME/.config/zsh"}"

# LANG.
# =====
export LANG=ja_JP.UTF-8

# PATH, MANPATH, INFOPATH, LD_LIBRARY_PATH.
# =========================================
typeset -U PATH path
typeset -U MANPATH manpath
typeset -U INFOPATH infopath

# for specific tools
path+=($HOME/.local/bin(N-/))
manpath+=($HOME/.local/man(N-/) $HOME/.local/share/man(N-/))
infopath+=($HOME/.local/info(N-/))

export PATH MANPATH INFOPATH LD_LIBRARY_PATH

# __END__
