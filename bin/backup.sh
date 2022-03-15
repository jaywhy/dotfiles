cd $HOME
/opt/homebrew/bin/brew bundle dump --file=~/OneDrive/Backup/Brewfile --force
pg_dumpall > ~/OneDrive/Backup/postgresql_backup.db

rsync -ah --info=progress2 ~/OneDrive/NaturaLawn/File\ Cabinet jason@192.168.5.21:/volume1/Backup/
rsync -ah --info=progress2 ~/OneDrive/Personal\ File\ Cabinet jason@192.168.5.21:/volume1/Backup/
rsync -ah --info=progress2 ~/OneDrive/Yates\ File\ Cabinet jason@192.168.5.21:/volume1/Backup/

cd $(dirname "$0")
./rsync_tmbackup.sh /Users/jason/ jason@192.168.5.21:/volume1/TimeMachine/ excluded_files.txt