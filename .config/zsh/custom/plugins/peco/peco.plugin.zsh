(( ${+commands[peco]} )) || return

if [[ "$TERM_PROGRAM" == "tmux" ]]; then
  export PECO_USE_TMUX=1
else
  export PECO_USE_TMUX=0
fi

# TODO: I'm not sure whether this process is proper or not
function _peco_clean_prompt() {
  if [[ -n $TMUX ]]; then
    zle reset-prompt
  else
    zle -R -c
  fi
}

function peco_select_history() {
  # print history in reverse order (from -1 (latest) to 1 (oldest))
  output=$(fc -l -n -1 1 | pecop --query "${LBUFFER}")

  if [[ $output != "" ]]; then
    BUFFER=$output
    CURSOR=$#BUFFER
  fi

  _peco_clean_prompt
}
zle -N peco_select_history
bindkey -M emacs '^R' peco_select_history
bindkey -M viins '^R' peco_select_history
bindkey -M vicmd '^R' peco_select_history

if (( ${+functions[marks]} )); then
  function peco_select_marks() {
    remove_color='sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[mGK]//g"'

    # parse directory from marks output (markname -> path) and quote if necessary
    output=$(marks | peco --query "${LBUFFER}" | eval ${remove_color})
    BUFFER=${(q)output##*-> }
    CURSOR=$#BUFFER
    _peco_clean_prompt
  }
  zle -N peco_select_marks
  bindkey -M emacs '^B' peco_select_marks
  bindkey -M viins '^B' peco_select_marks
  bindkey -M vicmd '^B' peco_select_marks
fi
