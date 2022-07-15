# Setup OSX.
xcode-select --install

# Time Machine Setup
# tmutil enable
# tmutil setdestination /Volumes/Backup

# VM images are big files that are changed everytime you run them. If you don't
# exclude them you'll run out of space on your backup drive. There maybe a work around.
# tmutil addexclusion ~/Virtual\ Machines/

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# git
git config --global user.name "Jason Yates"
git config --global user.email jason@jasonyates.me
git config --global core.editor "code --wait"

# fzf
$(brew --prefix)/opt/fzf/install

# Node / Typescript
npm i -g bash-language-server
npm install -g tslint
npm install -g typescript

# Ruby
gem install bundler
gem install pry
gem install rails
gem install rake
gem install rspec
gem install solargraph

# Vim
## vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim -c 'PlugInstall' -c 'qa'

# zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Terminal
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install --cask font-fira-code-nerd-font