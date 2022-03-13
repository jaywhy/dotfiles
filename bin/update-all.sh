# brew update && brew upgrade && brew cleanup; brew doctor
asdf plugin update ruby
asdf install ruby latest
asdf global ruby latest
gem update && gem cleanup
zsh .oh-my-zsh/tools/upgrade.sh