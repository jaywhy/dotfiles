#!/bin/bash

SOURCE="/Users/jason/code"
BACKUP_DIR="/Users/jason/OneDrive/Backup/code/"
DATE=$(date +%Y-%m-%d)
RETENTION_DAYS=10

BACKUP_FILE="$BACKUP_DIR/code-$DATE.tar.gz"
tar --exclude="**/node_modules" --exclude="source/*" -cvzf "$BACKUP_FILE" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"

find "$BACKUP_DIR" -mindepth 1 -maxdepth 1 -type f -name "*.tar.gz" -mtime +$RETENTION_DAYS -exec rm -f {} \;

echo "Backup for $DATE completed and old backups cleaned up."
