# -*- coding: utf-8; mode: sh; -*-
autoload zed # zsh editor

# pager
if exists less; then PAGER=less; fi
if exists lv;   then PAGER=lv;   fi
export PAGER
export LESS='-dMr'
export LV='-c'
