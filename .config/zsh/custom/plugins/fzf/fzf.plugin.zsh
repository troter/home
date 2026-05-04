(( ${+commands[fzf]} )) || return

export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
export FZF_ALT_C_COMMAND='fd --type d --hidden --strip-cwd-prefix --exclude .git --exclude node_modules'

if [[ "$TERM_PROGRAM" == "tmux" ]]; then
  export FZF_TMUX=1
else
  export FZF_TMUX=0
fi

eval "$(fzf --zsh)"

zle -N fzf-file-widget
bindkey -M emacs '^xf' fzf-file-widget

zle -N fzf-cd-widget
bindkey -M emacs '^x^o' fzf-cd-widget
