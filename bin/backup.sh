eval "$(/opt/homebrew/bin/brew shellenv)"


brew bundle dump --file="$BACKUP_ROOT/Brewfile" --force
/Applications/Postgres.app/Contents/Versions/latest/bin/pg_dumpall --quote-all-identifiers | gzip >"$BACKUP_ROOT/postgres.sql.gz"
