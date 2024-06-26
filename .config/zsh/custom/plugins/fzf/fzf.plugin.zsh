(( ${+commands[fzf]} )) || return

export FZF_DEFAULT_OPTS="--layout=reverse --inline-info"
if [[ "$TERM_PROGRAM" == "tmux" ]]; then
  export FZF_TMUX=1
else
  export FZF_TMUX=0
fi
FZF_CTRL_T_COMMAND= FZF_ALT_C_COMMAND= eval "$(fzf --zsh)"

zle -N fzf-file-widget
bindkey -M emacs '^xf' fzf-file-widget

zle -N fzf-cd-widget
bindkey -M emacs '^xb' fzf-cd-widget
