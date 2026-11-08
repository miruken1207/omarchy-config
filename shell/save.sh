#!/bin/bash
# Copy the live shell config into this repo (run before committing).
set -e
cd "$(dirname "$0")"
cp ~/.config/omarchy/shell.json shell.json
cp ~/.config/omarchy/shell.toml shell.toml

# Warn about plugins in shell.json that install.sh would not know how to get.
plugins=~/.config/omarchy/plugins
for id in $(jq -r '[.bar.layout[][].id, .plugins[].id] | unique[]' shell.json); do
  [[ $id == omarchy.* ]] && continue
  grep -q "^$id " plugins.txt && continue
  [[ -d $plugins/$id/.git ]] \
    && echo "not in plugins.txt: $id ($(git -C "$plugins/$id" remote get-url origin))" \
    || echo "not in plugins.txt: $id (local plugin, no git remote)"
done

git status --short .
