require "rake"

DOTFILES = %w[
  apps
  bat
  git
  ghostty
  hypr
  local
  omarchy
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
