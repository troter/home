# -*- coding: utf-8; mode: sh; -*-

function newscratch {
  new_dir="$HOME/sandbox/scratch/$(date +'%Y/%m/%Y-%m-%d_%H%M%S')"
  suffix=${1:-}
  if [ -n "$suffix" ]; then
    new_dir="${new_dir}.${suffix}"
  fi
  cur_dir="$HOME/scratch"
  mkdir -p $new_dir
  if [ -t 1 ]; then
    ln -nfs $new_dir $cur_dir
    print -z "cd ${cur_dir} # cd ${new_dir}"
  else
    echo $new_dir
  fi
}

function newjunkfile {
  suffix=${1:-txt}
  junkfile="$HOME/Dropbox/memo/junk/$(date +'%Y/%m/%Y-%m-%d_%H%M%S').${suffix}"
  mkdir -p $(dirname $junkfile)
  touch $junkfile
  if [ -t 1 ]; then
    print -z "vi ${junkfile}"
  else
    echo $junkfile
  fi
}

if [[ $(whence percol) != "" ]]; then
  function _percol_junkfile_source() {
    find $HOME/Dropbox/memo/junk -type f | sort -r
  }

  function junkfile() {
    local selected_file=$(_percol_junkfile_source | percol --query "$LBUFFER")
    echo $selected_file
    if [ -n "$selected_file" ]; then
      print -z "less ${selected_file}"
    fi
  }
  alias jf=junkfile

  function _percol_scratch_source() {
    find $HOME/sandbox/scratch -type d | sort -r
  }

  function scratch() {
    emulate -L zsh
    local selected_dir=$(_percol_scratch_source | percol --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
      print -z "cd ${selected_dir}"
    fi
  }
  alias scr=scratch
fi
