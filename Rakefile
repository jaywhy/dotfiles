require "rake"

def expand_paths(files)
  files.map { |f| File.expand_path(f) }
end

DOTFILES = %w[
  bin
  config/LazyVim
  gitconfig
  gitignore
  ideavimrc
  iex.exs
  rspec
  rubocop.yml
  tmux.conf
  vimrc
  zshrc
].freeze

desc "Install the dotfiles into home directory"
task :install do
  DOTFILES.each do |src|
    link_file(File.expand_path(src), home(".#{src}"))
  end
end

def link_file(source_file, target_file)
  rm(target_file) if File.exist?(target_file) || File.directory?(target_file)
  lnk(source_file, target_file)
end

def home(file)
  File.join(ENV["HOME"], file)
end

def lnk(source_file, target_file)
  sh %(ln -sf "#{source_file}" "#{target_file}")
end
