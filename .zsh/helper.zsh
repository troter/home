# -*- mode: sh -*-

function load_directory_files() {
  local dir=$1
  local glob=$2
  if [[ -z $glob ]] { glob="*" }
  for file ($(eval echo $dir/$glob | sort)) {
    echo -n "loding '$file' ... "
    source $file
    echo "complete."
  }
}
