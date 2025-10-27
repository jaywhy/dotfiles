eval "$(/opt/homebrew/bin/brew shellenv)"

export RESTIC_PASSWORD_COMMAND="security find-generic-password -s restic-backup-password -w"
BACKUP_ROOT="/Users/jason/Backup"

backup_directory() {
  local source_dir="$1"

  REPO="sftp:jason@192.168.5.21:/Backup/restic"
  EXCLUDES="$HOME/.config/restic/excludes.txt"

  echo "Backing up $source_dir"
  restic -r "$REPO" backup "$source_dir" --exclude-file "$EXCLUDES"
}

backup_directory "/Users/jason"

#restic -r "$REPO" forget --keep-daily 7 --keep-weekly 4 --keep-monthly 6 --prune
