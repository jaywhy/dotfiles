cd $HOME
tar -czvf ./OneDrive/Backup/code.tar.gz --exclude=node_modules Code/
cp -r Parallels/Windows\ 10.pvm ./OneDrive/Backup
brew bundle dump --file=OneDrive/Backup/Brewfile --force