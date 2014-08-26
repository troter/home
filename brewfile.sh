#!/bin/sh
# http://brew.sh/

brew update
# upgrade # run manually

# repositories
brew tap homebrew/dupes
brew tap homebrew/binary
brew tap josegonzalez/homebrew-php
brew tap caskroom/cask
brew install brew-cask

# browsers
brew cask install firefox
brew cask install google-chrome

# gui tools
brew cask install alfred
brew cask install cord
brew cask install cyberduck
brew cask install iterm2
brew cask install limechat
brew cask install keyremap4macbook

# editor
brew install emacs
brew cask install emacs

# tools
brew install colordiff
brew install gettext
brew install imagemagick
brew install jq
brew install the_silver_searcher
brew install tmux
brew install watch
brew install wget
brew install parallel
brew install editorconfig
brew install direnv

# servers
brew instal memcached
brew instal mongodb
brew instal mysql
brew instal redis

# programming languages
brew install gauche
brew install go
brew install nodejs
brew install phantomjs
brew install php54
brew install python
brew install python3
brew install sbcl

# vcs
brew install git
brew install mercurial
brew install subversion

brew cleanup
