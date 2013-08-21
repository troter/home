# -*- mode: sh -*-

function debug() { [ "$DEBUG" ] && echo ">>> $*"; }

function load_directory_files() {
  local dir=$1
  local glob=$2
  if [[ -z $glob ]] { glob="*" }
  debug "find $dir/$glob"
  for file ($(eval echo $dir/$glob | sort)) {
    debug "  load '$file' ... "
    source $file
  }
  debug "complete."
}

function exists() {
  which $1 &> /dev/null
}
