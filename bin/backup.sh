eval "$(/opt/homebrew/bin/brew shellenv)"

BACKUP_ROOT="/Users/jason/OneDrive/Backup"
mkdir -p "$BACKUP_ROOT"

brew bundle dump --file="$BACKUP_ROOT/Brewfile" --force
/Applications/Postgres.app/Contents/Versions/latest/bin/pg_dumpall --quote-all-identifiers | gzip >"$BACKUP_ROOT/postgres.sql.gz"

bash backup_directory.sh "$BACKUP_ROOT" "/Users/jason/code" "/Users/jason/code/source"
bash backup_directory.sh "$BACKUP_ROOT" "/Users/jason/Notes"
