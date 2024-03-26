(( ${+commands[zoxide]} )) || return

ZOXIDE_CMD_OVERRIDE=cd
eval "$(zoxide init --cmd ${ZOXIDE_CMD_OVERRIDE:-z} zsh)"

function zoxide-cd-widget() {
  \builtin local result
  result="$(\command zoxide query --interactive -- "${LBUFFER}")"
  if [[ -n "${result}" ]]; then
    BUFFER="cd ${(q-)result}"
    \builtin zle reset-prompt
    \builtin zle accept-line
  else
    \builtin zle reset-prompt
  fi
}
zle -N zoxide-cd-widget
bindkey -M emacs '^xb' zoxide-cd-widget
