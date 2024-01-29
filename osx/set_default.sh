#!/usr/bin/env bash
#
echo "Setting OSX Defaults"

# TODO - do some more research and testing here!!!

CURRENT_USER=$(stat -f %Su /dev/console)

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

###############################################################################
# Finder                                                                      #
###############################################################################

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

###############################################################################
# MISC                                                                        #
###############################################################################

# Disable Siri
sudo -u "$CURRENT_USER" defaults write com.apple.Siri StatusMenuVisible -bool false
sudo -u "$CURRENT_USER" defaults write com.apple.assistant.support "Assistant Enabled" -bool false

# Password prompting
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Disable sudden motion sensor as not useful for SSD
sudo pmset -a sms 0

# set default appearance for dock
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock orientation -string right
defaults write com.apple.dock tilesize -int 16
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Hide stuff from the fruit
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

#Disable Dashboard
# defaults write com.apple.dashboard mcx-disabled -bool true

# Set a really fast key repeat.
defaults write NSGlobalDomain KeyRepeat -int 0

# Wipe dock on new setup
defaults write com.apple.dock persistent-apps -array

#Set up hot corners
defaults write com.apple.dock "wvous-bl-corner" -int 4
defaults write com.apple.dock "wvous-bl-modifier" -int 0
defaults write com.apple.dock "wvous-br-corner" -int 10
defaults write com.apple.dock "wvous-br-modifier" -int 0
defaults write com.apple.dock "wvous-tl-corner" -int 3
defaults write com.apple.dock "wvous-tl-modifier" -int 0
defaults write com.apple.dock "wvous-tr-corner" -int 4
defaults write com.apple.dock "wvous-tr-modifier" -int 0

# # Set up Safari for development.
# defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# defaults write com.apple.Safari IncludeDevelopMenu -bool true
# defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
# defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
# defaults write com.apple.Safari ShowSidebarInTopSites -bool false
# defaults write com.apple.Safari ShowFavoritesBar -bool false

# Restart Finder and Dock so things happen!

killall Finder Dock Terminal SystemUIServer
