# -*- coding: utf-8; mode: sh; -*-
autoload zed # zsh editor

# pager
if [[ $(whence less) != "" ]]; then PAGER=less; fi
if [[ $(whence lv) != "" ]];   then PAGER=lv;   fi
export PAGER
export LESS='-dMr'
export LV='-c'
