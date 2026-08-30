#!/usr/bin/env bash
# One-time setup for a fresh Omarchy machine. Safe to re-run.
set -euo pipefail

# Packages Omarchy's base image doesn't ship that this setup needs.
pkgs=(
  stow
  zsh
  omarchy-zsh
  ghostty
  yazi
)

echo ":: pacman -Syu --needed ${pkgs[*]}"
sudo pacman -Syu --needed "${pkgs[@]}"

# Set ghostty as the default terminal (writes xdg-terminals.list; no install).
echo ":: omarchy default terminal ghostty"
omarchy default terminal ghostty

# Switch to zsh and write ~/.zshrc from the omarchy-zsh template.
echo ":: omarchy-setup-zsh"
omarchy-setup-zsh

# The generated ~/.zshrc doesn't source ~/.zshrc.local (from zsh-linux/); wire it in.
zshrc="$HOME/.zshrc"
line='[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local'
if [[ -f "$zshrc" ]] && ! grep -qF "$line" "$zshrc"; then
  printf '\n%s\n' "$line" >>"$zshrc"
  echo ":: appended .zshrc.local source line to ~/.zshrc"
fi

echo ":: now run: ./bin/install"
