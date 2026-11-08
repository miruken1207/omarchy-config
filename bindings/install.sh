#!/bin/bash
# Restore the config from this repo onto a fresh Omarchy install.
# Existing files are backed up as *.bak.<timestamp>.
set -e
cd "$(dirname "$0")"
ts=$(date +%s)

restore() {
  local src=$1 dst=$2
  mkdir -p "$(dirname "$dst")"
  [[ -e $dst ]] && cp "$dst" "$dst.bak.$ts"
  cp "$src" "$dst"
  echo "restored $dst"
}

restore hypr/bindings.lua ~/.config/hypr/bindings.lua
restore bin/workspace-step ~/.local/bin/workspace-step
chmod +x ~/.local/bin/workspace-step

hyprctl reload >/dev/null && hyprctl configerrors
