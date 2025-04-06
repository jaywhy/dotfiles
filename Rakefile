require "rake"

DOTFILES = %w[
  aerospace
  apps
  bat
  git
  hammerspoon
  karabiner
  kitty
  nvim
  tmux
  vim
  yazi
  zellij
  zsh
].freeze

desc "Install the dotfiles into home directory using GNU stow"
task :install do
  DOTFILES.each { stow(it) }
end

def stow(app)
  sh %(stow --ignore=DS_Store -t ~ #{app})
end
