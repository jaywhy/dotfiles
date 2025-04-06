eval "$(/opt/homebrew/bin/brew shellenv)"

cd $HOME
brew bundle dump --file=/Users/jason/OneDrive/Backup/Brewfile --force
/Applications/Postgres.app/Contents/Versions/latest/bin/pg_dumpall --quote-all-identifiers | gzip >/Users/jason/OneDrive/Backup/postgres.sql.gz
rsync -ah /Users/jason/OneDrive/NaturaLawn/File\ Cabinet jason@192.168.5.65:/volume1/Backup/
rsync -ah /Users/jason/OneDrive/Personal\ File\ Cabinet jason@192.168.5.65:/volume1/Backup/
rsync -ah /Users/jason/OneDrive/Yates\ File\ Cabinet jason@192.168.5.65:/volume1/Backup/

# Backup code
tar --exclude="/Users/jason/code/source" -czf /Users/jason/OneDrive/Backup/code/$(date +%Y%m%d%H%M%S).tar.gz /Users/jason/code

# Remove old backups
cd "$HOME/OneDrive/Backup/code"
/bin/ls -t | tail -n +11 | xargs -I {} rm -f {}

cd $HOME
