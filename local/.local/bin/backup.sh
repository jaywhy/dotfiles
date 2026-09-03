eval "$(/opt/homebrew/bin/brew shellenv)"

# ~/Documents is synced to the Synology via Syncthing
BACKUP_ROOT="$HOME/Documents/Backup"
mkdir -p "$BACKUP_ROOT"

brew bundle dump --file="$BACKUP_ROOT/Brewfile" --force
/Applications/Postgres.app/Contents/Versions/latest/bin/pg_dumpall --quote-all-identifiers | gzip >"$BACKUP_ROOT/postgres.sql.gz"
