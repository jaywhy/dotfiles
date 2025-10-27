eval "$(/opt/homebrew/bin/brew shellenv)"

export RESTIC_PASSWORD_COMMAND="security find-generic-password -s restic-backup-password -w"
BACKUP_ROOT="/Users/jason/Backup"

# brew bundle dump --file="$BACKUP_ROOT/Brewfile" --force
# /Applications/Postgres.app/Contents/Versions/latest/bin/pg_dumpall --quote-all-identifiers | gzip >"$BACKUP_ROOT/postgres.sql.gz"

backup_directory() {
  local source_dir="$1"

  REPO="sftp:jason@192.168.5.21:/Backup/restic"
  EXCLUDES="$HOME/.config/restic/excludes.txt"

  echo "Backing up $source_dir"
  restic -r "$REPO" backup "$source_dir" --exclude-file "$EXCLUDES" --tag daily
}

backup_directory "/Users/jason"
# backup_directory "/Users/jason/Documents/Personal File Cabinet"
# backup_directory "/Users/jason/Documents/Yates File Cabinet"
# backup_directory "/Users/jason/Library/CloudStorage/GoogleDrive-jason@nlawilm.com/Shared drives/NaturaLawn/File Cabinet"
# backup_directory "/Users/jason/Notes"

restic -r "$REPO" forget --keep-daily 7 --keep-weekly 4 --keep-monthly 6 --prune
