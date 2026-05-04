# -*- coding: utf-8; mode: sh; -*-
# Keybind configuration.
# ----------------------
function keybind_configuration() {
  # Apply baseline emacs-mode bindings only if no plugin has already bound ^R.
  if [[ "$(bindkey -M emacs '^R')" != '"^R" history-incremental-search-backward' ]]; then
    return
  fi

  bindkey -e

  # Pattern-based incremental history search.
  bindkey -M emacs '^R' history-incremental-pattern-search-backward
  bindkey -M emacs '^S' history-incremental-pattern-search-forward

  # Line-beginning incremental history search.
  autoload -U history-search-end
  zle -N history-beginning-search-backward-end history-search-end
  zle -N history-beginning-search-forward-end history-search-end
  bindkey -M emacs '^P' history-beginning-search-backward-end
  bindkey -M emacs '^N' history-beginning-search-forward-end

  [[ -n "$INSIDE_EMACS" ]] && unsetopt zle
}
keybind_configuration; unset -f keybind_configuration
