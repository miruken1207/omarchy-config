#!/bin/bash
# Copy the live Hyprland config into this repo (run before committing).
# bindings.lua lives in ../bindings/.
set -e
cd "$(dirname "$0")"
for f in hyprland.lua input.lua looknfeel.lua; do
  cp ~/.config/hypr/$f $f
done
git status --short .
