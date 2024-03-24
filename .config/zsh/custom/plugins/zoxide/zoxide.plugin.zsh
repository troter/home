(( ${+commands[zoxide]} )) || return

ZOXIDE_CMD_OVERRIDE=cd
eval "$(zoxide init --cmd ${ZOXIDE_CMD_OVERRIDE:-z} zsh)"

function zoxide-cd-widget() {
  __zoxide_zi "${LBUFFER}"
  BUFFER=""
  \builtin zle reset-prompt
}
zle -N zoxide-cd-widget
bindkey -M emacs '^xb' zoxide-cd-widget
