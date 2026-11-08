#!/bin/bash
# Restore hyprland.lua, input.lua and looknfeel.lua into ~/.config/hypr/.
# Existing files are backed up as *.bak.<timestamp>.
set -e
cd "$(dirname "$0")"
ts=$(date +%s)

for f in hyprland.lua input.lua looknfeel.lua; do
  dst=~/.config/hypr/$f
  [[ -e $dst ]] && cp "$dst" "$dst.bak.$ts"
  cp "$f" "$dst"
  echo "restored $dst"
done

# hyprland.lua sends screenshots here.
mkdir -p ~/Pictures/Screenshots

hyprctl reload >/dev/null && hyprctl configerrors
