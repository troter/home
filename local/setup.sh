#!/bin/sh

! [ -f ~/local/bin/ack                    ] && (curl http://betterthangrep.com/ack-standalone > ~/local/bin/ack && chmod 0755 ~/local/bin/ack)
! [ -f ~/local/src/ruby-1.9.2-p290.tar.gz ] && curl http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p290.tar.gz -o ~/local/src/ruby-1.9.2-p290.tar.gz
! [ -f ~/local/src/Python-3.2.2.tgz       ] && curl http://www.python.org/ftp/python/3.2.2/Python-3.2.2.tgz -o ~/local/src/Python-3.2.2.tgz
! [ -f ~/local/src/Python-2.7.2.tgz       ] && curl http://www.python.org/ftp/python/2.7.2/Python-2.7.2.tgz -o ~/local/src/Python-2.7.2.tgz
