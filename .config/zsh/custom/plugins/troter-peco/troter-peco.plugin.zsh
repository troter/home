(( ${+commands[peco]} )) || return

function peco_select_history() {
  # print history in reverse order (from -1 (latest) to 1 (oldest))
  BUFFER=$(fc -l -n -1 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle -R -c
}
zle -N peco_select_history
bindkey -M emacs '^R' peco_select_history
bindkey -M viins '^R' peco_select_history
bindkey -M vicmd '^R' peco_select_history

if (( ${+functions[marks]} )); then
  function peco_select_marks() {
    # parse directory from marks output (markname -> path) and quote if necessary
    BUFFER=${(q)"$(marks | peco --query "$LBUFFER")"##*-> }
    CURSOR=$#BUFFER
    zle -R -c
  }
  zle -N peco_select_marks
  bindkey -M emacs '^B' peco_select_marks
  bindkey -M viins '^B' peco_select_marks
  bindkey -M vicmd '^B' peco_select_marks
fi
