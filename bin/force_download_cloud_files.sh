#!/usr/bin/env bash
eval "$(/opt/homebrew/bin/brew shellenv)"

set -euo pipefail

# Force download cloud files by reading the first line of each file
mdfind 'kMDItemFSCreationDate > "$time.today"' -onlyin /Users/jason/Library/CloudStorage | while IFS= read -r file; do
    if [[ -f "$file" ]]; then
        echo "Processing: $file"
        /bin/cat "$file" > /dev/null 2>&1 || true
    fi
done
