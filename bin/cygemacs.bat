@echo off
set CYGWIN=tty
set EMACS=/cygdrive/c/opt/emacs-23.3a-20110815/bin/runemacs
C:
chdir C:\cygwin\bin

zsh --login -i -c %EMACS% --debug-init
