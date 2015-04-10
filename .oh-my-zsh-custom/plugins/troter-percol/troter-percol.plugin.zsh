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

  function _percol_select_repository_source() {
    local -a target_dirs
    target_dirs=(sandbox work)
    for dir in $target_dirs; do
      ls -d $HOME/$dir/*/
      [ -d $HOME/$dir/github.com ] && ls -d $HOME/$dir/github.com/*/*/
      [ -d $HOME/$dir/bitbucket.org ] && ls -d $HOME/$dir/bitbucket.org/*/*/
      [ -d $HOME/$dir/code.google.com ] && ls -d $HOME/$dir/code.google.com/*/*/
    done
    [[ $(whence ghq) != "" ]] && ghq list --full-path
  }

  function percol_select_repository() {
    local selected_dir=$(_percol_select_repository_source | percol --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
      BUFFER="cd ${selected_dir}"
      CURSOR=$#BUFFER         # move cursor
      zle accept-line
    fi
    zle -R -c               # refresh
  }
  zle -N percol_select_repository
  bindkey '^x^f' percol_select_repository

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
