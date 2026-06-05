#!/bin/bash

backup_root="$1"
source_dir="$2"
exclude_pattern="$3"

dir_name=$(basename "$source_dir")
backup_dir="$backup_root/$dir_name"
timestamp=$(date +%Y%m%d%H%M%S)

backup_file="$backup_dir/$timestamp.tar.gz"

mkdir -p "$backup_dir"

echo "Backing up $source_dir to $backup_file"
parent_dir=$(dirname "$source_dir")

if [ -d "$exclude_pattern" ]; then
    tar -C "$parent_dir" --exclude="$exclude_pattern" -cf - "$dir_name" | pv | gzip >"$backup_file"
else
    tar -C "$parent_dir" -cf - "$dir_name" | pv | gzip >"$backup_file"
fi

echo "Starting cleanup in $backup_dir"
cd "$backup_dir" || exit 1
/bin/ls -t *.tar.gz | tail -n +6 | xargs -I {} rm -f {}
cd "$HOME"

