# Homebrew
brew update
brew upgrade
brew cleanup
brew doctor

# asdf
asdf plugin update nodejs
asdf install nodejs latest
asdf global nodejs latest
asdf plugin update ruby
asdf install ruby latest
asdf global ruby latest
asdf plugin update erlang
asdf install erlang latest
asdf global erlang latest
asdf plugin update elixir
asdf install elixir latest
asdf global elixir latest

# Elixir
mix local.hex
mix archive.install hex phx_new

# Ruby
gem update
gem cleanup
gem update --system

# Zsh
zsh ~/.oh-my-zsh/tools/upgrade.sh

# LunarVim
lvim +LvimUpdate +q
