# -*- coding: utf-8; mode: sh; -*-

if [[ $(whence percol) != "" ]]; then
  function percol_select_history() {
    local tac
    [[ $(whence gtac) != "" ]] && tac="gtac" || { [[ $(whence tac) != "" ]] && tac="tac" || { tac="tail -r" } }
    BUFFER=$(''history -n 1 | eval $tac | percol --query "$LBUFFER")
    CURSOR=$#BUFFER         # move cursor
    zle -R -c               # refresh
  }

  zle -N percol_select_history
  bindkey '^R' percol_select_history

  function ppgrep() {
    if [[ $1 == "" ]]; then
      PERCOL=percol
    else
      PERCOL="percol --query $1"
    fi
    ps aux | eval $PERCOL | awk '{ print $2 }'
  }

  function ppkill() {
    if [[ $1 =~ "^-" ]]; then
      QUERY=""            # options only
    else
      QUERY=$1            # with a query
      [[ $# > 0 ]] && shift
    fi
    ppgrep $QUERY | xargs kill $*
  }
fi
