# -*- coding: utf-8 -*-

## create emacs env file
ruby -e 'ARGV.each {|_| puts %Q|(setenv "#{_}" "#{ENV[_]}")| if ENV[_] }' PATH > ~/.emacs.d/shellenv.el
