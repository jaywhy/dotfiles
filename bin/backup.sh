eval "$(/opt/homebrew/bin/brew shellenv)"

# Base paths
BACKUP_ROOT="/Users/jason/OneDrive/Backup"
REMOTE_BACKUP="jason@192.168.5.65:/volume1/Backup"

sync_directory() {
    local source="$1"
    echo "Syncing $source to remote backup"
    rsync -ah --progress "$source" "$REMOTE_BACKUP/"
}

brew bundle dump --file="$BACKUP_ROOT/Brewfile" --force
/Applications/Postgres.app/Contents/Versions/latest/bin/pg_dumpall --quote-all-identifiers | gzip > "$BACKUP_ROOT/postgres.sql.gz"

sync_directory "/Users/jason/Library/CloudStorage/GoogleDrive-jason@nlawilm.com/Shared drives/NaturaLawn/File Cabinet"
sync_directory "/Users/jason/OneDrive/Personal File Cabinet"
sync_directory "/Users/jason/OneDrive/Yates File Cabinet"

backup_directory() {
    local source_dir="$1"
    local exclude_pattern="$2"
    local keep_count="${3:-10}"
    local dir_name=$(basename "$source_dir")
    local backup_dir="$BACKUP_ROOT/$dir_name"
    local timestamp=$(date +%Y%m%d%H%M%S)
    local backup_file="$backup_dir/$timestamp.tar.gz"

    mkdir -p "$backup_dir"

    echo "Backing up $source_dir to $backup_file"
    tar --exclude="$exclude_pattern" -cf - "$source_dir" | pv | gzip > "$backup_file"

    cd "$backup_dir"
    /bin/ls -t | tail -n +$((keep_count + 1)) | xargs -I {} rm -f {}
    cd "$HOME"
}

# Backup local directories
backup_directory "/Users/jason/code" "/Users/jason/code/source"
backup_directory "/Users/jason/Notes"

cd $HOME
