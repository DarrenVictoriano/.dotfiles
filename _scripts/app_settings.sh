#!/bin/sh

# Function to set or add plist properties
set_or_add_plist_property() {
    property=$1
    type=$2
    value=$3
    plist_path=~/Library/Preferences/com.googlecode.iterm2.plist

    # Check if the property exists, suppressing both stdout and stderr
    /usr/libexec/PlistBuddy -c "Print $property" "$plist_path" >/dev/null 2>&1

    if [ $? -eq 0 ]; then
        # If property exists, set it, suppressing both stdout and stderr
        /usr/libexec/PlistBuddy -c "Set $property $value" "$plist_path" >/dev/null 2>&1
        new_value=$(/usr/libexec/PlistBuddy -c "Print $property" "$plist_path")
        echo "Set: $property -> $new_value"
    else
        # If property does not exist, add it, suppressing both stdout and stderr
        /usr/libexec/PlistBuddy -c "Add $property $type $value" "$plist_path" >/dev/null 2>&1
        new_value=$(/usr/libexec/PlistBuddy -c "Print $property" "$plist_path")
        echo "Add: $property -> $new_value"
    fi
}

# # iTerm2: Setup Font
# set_or_add_plist_property ":'New Bookmarks':0:'Normal Font'" string "'MesloLGS-NF-Regular 14'"
# set_or_add_plist_property ":'New Bookmarks':0:'Draw Powerline Glyphs'" bool 1
# set_or_add_plist_property ":'New Bookmarks':0:'Horizontal Spacing'" integer 1
# set_or_add_plist_property ":'New Bookmarks':0:'Vertical Spacing'" integer 1
# set_or_add_plist_property ":'New Bookmarks':0:'Use Bold Font'" bool 1
# set_or_add_plist_property ":'New Bookmarks':0:'Use Bright Bold'" bool 1
# set_or_add_plist_property ":'New Bookmarks':0:'Use Italic Font'" bool 1
# set_or_add_plist_property ":'New Bookmarks':0:'ASCII Anti Aliased'" bool 1
# set_or_add_plist_property ":'New Bookmarks':0:'Non-ASCII Anti Aliased'" bool 1
# set_or_add_plist_property ":'New Bookmarks':0:'Use Non-ASCII Font'" bool 0
# set_or_add_plist_property ":'New Bookmarks':0:'Ambiguous Double Width'" bool 0
#
# # iTerm2: Set window Title to ""
# set_or_add_plist_property ":'New Bookmarks':0:'Custom Window Title'" string "''"
# set_or_add_plist_property ":'New Bookmarks':0:'Use Custom Window Title'" bool 1
#
# # iTerm2: Set unlimited scrolling
# set_or_add_plist_property ":'New Bookmarks':0:'Scrollback Lines'" integer 0
# set_or_add_plist_property ":'New Bookmarks':0:'Unlimited Scrollback'" bool 1
#
# # iTerm2: Set window size
# set_or_add_plist_property ":'New Bookmarks':0:'Columns'" integer 100
# set_or_add_plist_property ":'New Bookmarks':0:'Rows'" integer 30
#
# # iTerm2: Terminal Type
# set_or_add_plist_property ":'New Bookmarks':0:'Terminal Type'" string "'xterm-256color'"
#
# # iTerm2: Hide Scroll bar and make Theme to Minimal
# defaults write com.googlecode.iterm2 "HideScrollbar" 1
# defaults write com.googlecode.iterm2 "TabStyleWithAutomaticOption" 5

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
defaults write -g InitialKeyRepeat -int 13 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1         # normal minimum is 2 (30 ms)

# MacOS: make dock auto-hide animation fast
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -int 0
defaults write com.apple.dock autohide-time-modifier -float 0.4
killall Dock

echo "app settings updated!"
