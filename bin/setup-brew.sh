#!/usr/bin/env bash
# Install Homebrew (if missing) and everything in ./Brewfile. Safe to re-run.
#
# Sign into the App Store first, or the `mas` entries in the Brewfile will fail.
set -euo pipefail

cd "$(dirname "$0")/.."

if ! command -v brew >/dev/null 2>&1; then
  echo ":: installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo ":: brew bundle --file=Brewfile"
brew bundle --file=Brewfile

echo ":: done. Next: ./bin/install, then ./bin/mac.sh"
