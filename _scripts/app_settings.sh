#!/bin/sh

# Finder: Hide hard drives on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

# Finder: Hide removable media hard drives on desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# Finder: Show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder: Show hidden files inside the finder
defaults write com.apple.finder "AppleShowAllFiles" -bool true

# Finder: Show Status Bar
defaults write com.apple.finder "ShowStatusBar" -bool true

# Finder: Set search scope to current folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# MacOS: disable press and hold for vim motion
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# MacOS: Make key repeat faster
# defaults write -g InitialKeyRepeat -int 14 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)

# MacOS: make dock auto-hide animation fast
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
killall Dock

echo "app settings updated!"
