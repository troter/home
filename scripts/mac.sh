#!/bin/bash

if [ $(uname) != 'Darwin' ]; then
  echo "Should run on Mac OS X!"
  exit 1
fi

# Show admin host info
sudo defaults write /Library/Preferences/com.apple.loginwindow AdminHostInfo 1

# Enable locate service
sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist

# Finder extra options.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool TRUE
defaults write com.apple.finder PathBarRootAtHome -bool TRUE
defaults write com.apple.finder AppleShowAllFiles -bool TRUE
killall Finder

# Don't write ds_sote on network store
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool TRUE
