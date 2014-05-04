# -*- mode: sh -*-

function debug() { [ "$DEBUG" ] && echo ">>> $*"; }

alias load_directory_files_function='printf "$(cat <<EOT
  local load_directory_files_dir=%s
  local load_directory_files_glob=%s
  if [[ -z \$load_directory_files_glob ]] { load_directory_files_glob="*" }
  debug "find \$load_directory_files_dir/\${load_directory_files_glob:-*}"
  for file (\$(eval echo \$load_directory_files_dir/\$load_directory_files_glob | sort)) {
    debug "  load \$file ... "
    source \$file
  }
  debug "complete."
  unset load_directory_files_dir
  unset load_directory_files_glob
EOT
)"'

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
