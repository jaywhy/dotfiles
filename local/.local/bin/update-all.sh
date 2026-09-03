# Homebrew
brew update
brew upgrade
brew cleanup
brew doctor

mise upgrade
mise prune

mix local.hex
mix archive.install hex phx_new

gem update
gem update --system

rustup update

nvim --headless -c 'Lazy update' -c 'qa'

zsh ~/.oh-my-zsh/tools/upgrade.sh

mas upgrade
softwareupdate -i -a

gh extension upgrade gh-copilot
gh extension upgrade --all

#atuin update

code --update-extensions

pip install --upgrade pip

npm update -g
