# Run backup
backup.sh

# Homebrew
brew update
brew upgrade
brew cleanup
brew doctor

# asdf
asdf plugin update --all

asdf install nodejs latest
asdf global nodejs latest

asdf install ruby latest
asdf global ruby latest

KERN_BUILD_DOCS=yes asdf install erlang latest
asdf global erlang latest

asdf install elixir latest
asdf global elixir latest

asdf install python latest
asdf global python latest

# mise
mise upgrade

# Elixir
mix local.hex
mix archive.install hex phx_new

# Ruby
gem update
# gem cleanup
gem update --system

# Zsh
zsh ~/.oh-my-zsh/tools/upgrade.sh

# macOS
softwareupdate -i -a

# github copilot

gh extension upgrade gh-copilot
