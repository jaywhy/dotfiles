eval "$(/opt/homebrew/bin/brew shellenv)"

cd $HOME
brew bundle dump --file=/Users/jason/OneDrive/Backup/Brewfile --force
pg_dumpall > /Users/jason/OneDrive/Backup/postgresql_backup.db

rsync -ah --info=progress2 /Users/jason/OneDrive/NaturaLawn/File\ Cabinet jason@192.168.5.65:/volume1/Backup/
rsync -ah --info=progress2 /Users/jason/OneDrive/Personal\ File\ Cabinet jason@192.168.5.65:/volume1/Backup/
rsync -ah --info=progress2 /Users/jason/OneDrive/Yates\ File\ Cabinet jason@192.168.5.65:/volume1/Backup/
