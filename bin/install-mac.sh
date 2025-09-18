# Setup OSX.
xcode-select --install

# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew install amazon-q autojump balenaetcher bartender backblaze bat bettertouchtool btop daisydisk dash@6 discord@canary docker-desktop dupeguru eza
brew install fd firefox flyctl font-fira-code-nerd-font font-hack-nerd-font font-symbols-only-nerd-font fzf git gh hazel htop iina iterm2 karabiner-elements keyboard-maestro
brew install lazygit lua macvim-app messenger meilisearch mise neovim
brew install ngrok nmap node numi ocrmypdf pearcleaner pdfpenpro pgadmin4 postgres-unofficial readwise-ibooks
brew install resilio-sync ripgrep rsync shottr spotify steam tmux trash-cli
brew install typora visual-studio-code vlc wget yarn zed zsh

# mise
mise use -g ruby
mise use -g elixir
mise use -g nodejs
mise use -g python

# fzf
$(brew --prefix)/opt/fzf/install

# Ruby
gem install bundler
gem install rails
gem install rake
gem install rspec


# zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
chsh -s `which zsh`
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
