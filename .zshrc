# -*- coding: utf-8; mode: sh; -*-
# user generic .zshrc file for zsh(1).
# ====================================

# umask and ulimit.
umask 022
ulimit -c 0

# Load helper functions
source ~/.zsh.d/helper.zsh

load_directory_files "~/.zsh.d/init" "*.sh"
load_directory_files "~/.zsh.d/function" "*.sh"

# Load local configuration file.
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# __END__
