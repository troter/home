# -*- coding: utf-8; mode: sh; -*-
# Keybind configuration.
# ----------------------
if ! exists percol; then
  function keybind_configuration() {
    bindkey -e

    # historical backward/forward search with linehead string binded to ^P/^N
    if zle -la | grep -q '^history-incremental-pattern-search'; then
      # zsh 4.3.10 以降でのみ有効
      bindkey '^R' history-incremental-pattern-search-backward
      bindkey '^S' history-incremental-pattern-search-forward
    else
      autoload history-search-end
      zle -N history-beginning-search-backward-end history-search-end
      zle -N history-beginning-search-forward-end history-search-end
      bindkey "^P" history-beginning-search-backward-end
      bindkey "^N" history-beginning-search-forward-end
    fi
    [[ $EMACS = t ]] && unsetopt zle
  }
  keybind_configuration; unset -f keybind_configuration
fi
