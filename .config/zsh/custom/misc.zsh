# -*- coding: utf-8; mode: sh; -*-
autoload zed # zsh editor

# pager
if [[ $(whence less) != "" ]]; then PAGER=less; fi
export PAGER
export LESS='-dMr'
