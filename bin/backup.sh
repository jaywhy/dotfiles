cd $HOME
/opt/homebrew/bin/brew bundle dump --file=~/OneDrive/Backup/Brewfile --force

rsync -avh ~/OneDrive/NaturaLawn/File\ Cabinet jason@192.168.5.21:/volume1/Backup/
rsync -avh ~/OneDrive/Personal\ File\ Cabinet jason@192.168.5.21:/volume1/Backup/
rsync -avh ~/OneDrive/Yates\ File\ Cabinet jason@192.168.5.21:/volume1/Backup/