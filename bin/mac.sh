#!/usr/bin/env bash
# macOS preferences. Run after ./bin/install. Re-runnable.
set -eu

# Hide menu bar
#defaults write NSGlobalDomain _HIHideMenuBar -bool true

# fast key repeat rate, requires logout to take effect
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# set finder to display full path in title bar
#defaults write com.apple.finder '_FXShowPosixPathInTitle' -bool true

# Speeds up the sheets things. The save menu popdown.
defaults write NSGlobalDomain NSWindowResizeTime .001

# Disable the “Are you sure you want to open this application?” dialog
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Use column view in all Finder windows by default
# Four-letter codes for the other view modes: `Nlsv`, `icnv`, `clmv`, `Flwv`
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

killall Finder || true

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

#########################################
# Dock
#########################################

# Move dock to left
# defaults write com.apple.dock orientation -string 'left'

# Removes the auto-hiding Dock delay and the animation when hiding/showing the Dock
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Drag any part of the window to move it using ctrl+cmd
defaults write -g NSWindowShouldDragOnGesture -bool true

# Auto hide the dock
defaults write com.apple.dock autohide -int 1

killall Dock || true

# 𝗗𝗶𝘀𝗮𝗯𝗹𝗲 𝗔𝗻𝗻𝗼𝘆𝗶𝗻𝗴 𝗗𝗶𝘀𝗸 𝗪𝗮𝗿𝗻𝗶𝗻𝗴
if sudo -n true 2>/dev/null || sudo true; then
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.DiskArbitration.diskarbitrationd.plist DADisableEjectNotification -bool YES
  sudo pkill diskarbitrationd || true
fi

# disable Dock bouncing of apps
defaults write com.apple.dock no-bouncing -bool TRUE
