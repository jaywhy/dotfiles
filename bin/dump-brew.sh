#!/usr/bin/env bash
# Refresh ./Brewfile from what's currently installed.
#
# --no-vscode: VS Code extensions sync through Settings Sync, not here.
set -euo pipefail

cd "$(dirname "$0")/.."

brew bundle dump --file=Brewfile --force --no-vscode

echo ":: Brewfile updated. Review with: git diff Brewfile"
