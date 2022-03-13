############################################################
# Setup OSX.
############################################################

xcode-select --install


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

# Remove all items from dock

brew install dockutil
dockutil --remove all
brew uninstall dockutil

##########################################
# Links
##########################################

ln -s /Users/jason/OneDrive/Music/iTunes /Users/jason/Music

##########################################
# Configuration
##########################################

# git

git config --global user.name "Jason Yates"
git config --global user.email jason@jasonyates.me
git config --global core.editor "code --wait"

# PostgreSQL
# http://exponential.io/blog/2015/02/21/install-postgresql-on-mac-os-x-via-brew/

brew services start postgresql
createdb jason

# fzf

$(brew --prefix)/opt/fzf/install

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
