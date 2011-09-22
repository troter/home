#!/bin/sh

! [ -f ~/local/bin/ack                    ] && (curl http://betterthangrep.com/ack-standalone > ~/local/bin/ack && chmod 0755 ~/local/bin/ack)
! [ -f ~/local/src/ruby-1.9.2-p290.tar.gz ] && curl http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.gz -o ~/local/src/ruby-1.9.2-p290.tar.gz
! [ -f ~/local/src/Python-3.2.2.tgz       ] && curl http://www.python.org/ftp/python/3.2.2/Python-3.2.2.tgz -o ~/local/src/Python-3.2.2.tgz
! [ -f ~/local/src/Python-2.7.2.tgz       ] && curl http://www.python.org/ftp/python/2.7.2/Python-2.7.2.tgz -o ~/local/src/Python-2.7.2.tgz
! [ -f ~/local/src/stow-master.tar.gz     ] && curl http://git.savannah.gnu.org/cgit/stow.git/snapshot/stow-master.tar.gz -o ~/local/src/stow-master.tar.gz
! [ -f ~/local/src/emacs-23.3a.tar.gz     ] && curl http://ftp.gnu.org/pub/gnu/emacs/emacs-23.3a.tar.gz -o ~/local/src/emacs-23.3a.tar.gz
! [ -f ~/local/src/zsh-4.3.12.tar.gz      ] && curl http://ftp.jaist.ac.jp/pub/sourceforge/z/project/zs/zsh/zsh-dev/4.3.12/zsh-4.3.12.tar.gz -o ~/local/src/zsh-4.3.12.tar.gz
