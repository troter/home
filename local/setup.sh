#!/bin/sh

! [ -f ~/local/bin/ack                    ] && (curl http://betterthangrep.com/ack-standalone > ~/local/bin/ack && chmod 0755 ~/local/bin/ack)
! [ -f ~/local/src/stow-2.1.3.tar.gz     ] && curl http://ftp.gnu.org/gnu/stow/stow-2.1.3.tar.gz -o ~/local/src/stow-2.1.3.tar.gz
! [ -f ~/local/src/emacs-23.3a.tar.gz     ] && curl http://ftp.gnu.org/pub/gnu/emacs/emacs-23.3a.tar.gz -o ~/local/src/emacs-23.3a.tar.gz
! [ -f ~/local/src/zsh-4.3.12.tar.gz      ] && curl http://ftp.jaist.ac.jp/pub/sourceforge/z/project/zs/zsh/zsh-dev/4.3.12/zsh-4.3.12.tar.gz -o ~/local/src/zsh-4.3.12.tar.gz
