# Hide menu bar
#defaults write NSGlobalDomain _HIHideMenuBar -bool true

# fast key repeat rate, requires reboot to take effect
defaults write ~/Library/Preferences/.GlobalPreferences KeyRepeat -int 1
defaults write ~/Library/Preferences/.GlobalPreferences InitialKeyRepeat -int 15

# set finder to display full path in title bar
#defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true

# Speeds up the sheets things. The save menu popdown.
defaults write NSGlobalDomain NSWindowResizeTime .001

defaults write com.apple.finder DisableAllAnimations -bool true

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `Nlsv`, `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Finder: allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

killall Finder

# Disable opening and closing window animations
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#########################################
# Dock
#########################################

# Move dock to left
# defaults write com.apple.dock orientation -string 'left'

# Removes the auto-hiding Dock delay and the animation when hiding/showing the Dock
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0

# Disable fade-in and fade-out animation when opening launchpad
defaults write com.apple.dock springboard-show-duration -int 0
defaults write com.apple.dock springboard-hide-duration -int 0

# Auto hide the dock
defaults write com.apple.dock autohide -int 1

killall Dock

# 𝗗𝗶𝘀𝗮𝗯𝗹𝗲 𝗔𝗻𝗻𝗼𝘆𝗶𝗻𝗴 𝗗𝗶𝘀𝗸 𝗪𝗮𝗿𝗻𝗶𝗻𝗴
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES && sudo pkill diskarbitrationd