# Homebrew
brew update
brew upgrade
brew cleanup
brew doctor

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

# atuin
atuin update
