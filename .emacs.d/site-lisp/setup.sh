#!/bin/sh

! [ -d "elscreen-1.4.6"       ] && curl -0 ftp://ftp.morishima.net/pub/morishima.net/naoto/ElScreen/elscreen-1.4.6.tar.gz
! [ -d "elscreen-dired-0.1.0" ] && curl -0 ftp://ftp.morishima.net/pub/morishima.net/naoto/ElScreen/elscreen-dired-0.1.0.tar.gz
! [ -d "color-theme-6.6.0"    ] && curl -O http://download.savannah.gnu.org/releases/color-theme/color-theme-6.6.0.tar.gz
! [ -d "haskell-mode-2.8.0"   ] && curl -O http://projects.haskell.org/haskellmode-emacs/haskell-mode-2.8.0.tar.gz
! [ -d "apel-10.8"            ] && curl -O http://kanji.zinbun.kyoto-u.ac.jp/~tomo/lemi/dist/apel/apel-10.8.tar.gz
! [ -d "auto-complete-1.3.1"  ] && wget http://github.com/m2ym/auto-complete/tarball/v1.3.1 --no-check-certificate -O auto-complete-1.3.1.tar.gz
! [ -f "php-mode.el"          ] && curl -O http://php-mode.svn.sourceforge.net/svnroot/php-mode/tags/php-mode-1.5.0/php-mode.el
