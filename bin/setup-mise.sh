#!/usr/bin/env bash
# Install the global language toolchains with mise. Safe to re-run.
#
# Not on Omarchy — it customizes ~/.config/mise/config.toml itself.
set -euo pipefail

mise settings set idiomatic_version_file_enable_tools ruby

mise use -g erlang@latest
mise use -g elixir@latest
mise use -g python@latest
mise use -g ruby@latest
