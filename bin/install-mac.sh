############################################################
# Setup OSX.
############################################################

xcode-select --install

# Setup computer name
#sudo scutil --set ComputerName "Jason's Mac"
#sudo scutil --set HostName "jason-mac"
#sudo scutil --set LocalHostName "jason-mac"

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

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true


#####################################################
# Time Machine Setup
#####################################################

# tmutil enable
# tmutil setdestination /Volumes/Backup

# VM images are big files that are changed everytime you run them. If you don't
# exclude them you'll run out of space on your backup drive. There maybe a work around.
# tmutil addexclusion ~/Virtual\ Machines/

#####################################################
# Homebrew
####################################################

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install autojump
brew install cmake
brew install ctags
brew install elixir
brew install exercism
brew install fd
brew install fzf
brew install git
brew install go
brew install macvim
brew install ncdu
brew install node
brew install postgres
brew install ripgrep
brew install rbenv
brew install rmtrash
brew install ruby-build
brew install the_silver_searcher
brew install tmux
brew install tree
brew install wget
brew install yarn
brew install zsh

brew tap caskroom/cask
brew cask install alfred
brew cask install backblaze
brew cask install bartender
brew cask install bettertouchtool
brew cask install discord
brew cask install evernote
brew cask install firefox
brew cask install google-backup-and-sync
brew cask install google-chrome
brew cask install hazel
brew cask install iterm2
brew cask install karabiner-elements
brew cask install keyboard-maestro
brew cask install kindle
brew cask install launchcontrol
brew cask install macvim
brew cask install mos
brew cask install parallels
brew cask install pdfpenpro
brew cask install pgadmin4
brew cask install qbittorrent
brew cask install quickbooks-online
brew cask install rescuetime
brew cask install resilio-sync
brew cask install rubymine
brew cask install slack
brew cask install skitch
brew cask install spotify
brew cask install taskpaper
brew cask install things
brew cask install vitamin-r
brew cask install vlc
brew cask install visual-studio-code

brew tap homebrew/cask-fonts


#########################################
# Dock
#########################################

# Move dock to left
defaults write com.apple.dock orientation -string 'left'

# Removes the auto-hiding Dock delay and the animation when hiding/showing the Dock
defaults write com.apple.Dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -int 0

# Disable fade-in and fade-out animation when opening launchpad
defaults write com.apple.dock springboard-show-duration -int 0
defaults write com.apple.dock springboard-hide-duration -int 0

# Auto hide the dock
defaults write com.apple.dock autohide -int 1
killall Dock

# Remove all items from dock

brew install dockutil
dockutil --remove all
brew uninstall dockutil

##########################################
# Links
##########################################

ln -s /Users/jason/OneDrive/Music/iTunes /Users/jason/Music
ln -s /Users/jason/OneDrive/Code /Users/jason/Code

##########################################
# Configuration
##########################################

# git

git config --global user.name "Jason Yates"; git config --global user.email jaywhy@gmail.com

# PostgreSQL
# http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/

brew services start postgresql
createdb jason


# ln -sfv /usr/local/opt/postgres/homebrew.mxcl.postgresql.plist ~/Library/LaunchAgents
# launchctl load ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Node / Typescript
npm i -g bash-language-server
npm install -g tslint
npm install -g typescript

# Ruby

rbenv init
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
clear
echo "What version of Ruby? [y/N]"
read -r
if [[ $REPLY ]]
then
    rbenv install $REPLY
    rbenv global $REPLY
fi

gem install bundler
gem install pry
gem install rails
gem install rake
gem install rspec
gem install solargraph

# Vim

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd ~/.vim/plugged/youcompleteme
chmod +x install.py
./install.py --clang-completer
cd -

# zsh

wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

##########################################
# ImageMagick
##########################################

# brew install imagemagick@6
# export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
# brew link --force imagemagick@6
# gem install rmagick
