# -*- mode: sh -*-

function if_debug() {
  [[ -n $DEBUG ]]
}

function load_directory_files() {
  local dir=$1
  local glob=$2
  if [[ -z $glob ]] { glob="*" }
  for file ($(eval echo $dir/$glob | sort)) {
    if_debug && echo -n "loding '$file' ... "
    source $file
    if_debug && echo "complete."
  }
}
