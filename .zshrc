# -*- coding: utf-8; mode: sh; -*-
# user generic .zshrc file for zsh(1).
# ====================================

# umask and ulimit.
umask 022
ulimit -c 0

function load_directory_files() {
  local dir=$1
  local glob=$2
  if [[ -z $glob ]] { glob="*" }
  for file (`eval echo $dir/$glob`) {
    echo -n "loding '$file' ... "
    source $file
    echo "complete."
  }
}

load_directory_files "~/.zsh/init" "*.sh"
load_directory_files "~/.zsh/function" "*.sh"
unfunction load_directory_files

# Load local configuration file.
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# __END__

#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "/Users/takumi/.gvm/bin/gvm-init.sh" && -z $(which gvm-init.sh | grep '/gvm-init.sh') ]] && source "/Users/takumi/.gvm/bin/gvm-init.sh"
