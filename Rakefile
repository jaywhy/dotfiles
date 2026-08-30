require "rake"

COMMON = %w[
  apps
  bat
  git
  local
  nvim
  tmux
  vim
  yazi
  zellij
].freeze

LINUX = %w[
  ghostty
  hypr
  omarchy
].freeze

MACOS = %w[
  raycast
  zsh
].freeze

def macos? = RUBY_PLATFORM.include?("darwin")

def dotfiles = COMMON + (macos? ? MACOS : LINUX)

desc "Install the dotfiles into home directory using GNU stow"
task :install do
  dotfiles.each { stow(it) }
end

def stow(app)
  sh %(stow --ignore=DS_Store -t ~ #{app})
end
