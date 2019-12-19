cd $HOME
brew bundle dump --file=OneDrive/Backup/Brewfile --force
rsync -avh --delete --exclude={node_modules,.DS_Store,.elixir_ls,_build,deps,Cache,cache,tmp,.pub-cache,packages} ~/Code ~/Desktop ~/Pictures ~/Documents OneDrive/Backup/ | tee /Users/jason/OneDrive/Backup/backup.log
rsync -avh ~/OneDrive/NaturaLawn OneDrive/Backup/