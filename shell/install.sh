#!/bin/bash
# Install the plugins listed in plugins.txt, then restore shell.json and shell.toml.
# Existing files are backed up as *.bak.<timestamp>.
set -e
cd "$(dirname "$0")"
config=~/.config/omarchy
ts=$(date +%s)

# Audio Visualizer draws with cava.
command -v cava >/dev/null || omarchy pkg add cava

while read -r id url; do
  [[ -z $id || $id == \#* ]] && continue
  if [[ -d $config/plugins/$id ]]; then
    echo "already installed: $id"
  else
    omarchy plugin add "$url" --yes
  fi
done < plugins.txt

# Plugins in shell.json that cannot be installed from here.
for id in $(jq -r '[.bar.layout[][].id, .plugins[].id] | unique[]' shell.json); do
  [[ $id == omarchy.* || -d $config/plugins/$id ]] && continue
  echo "MISSING: $id (local plugin, install it by hand)"
done

for f in shell.json shell.toml; do
  [[ -e $config/$f ]] && cp "$config/$f" "$config/$f.bak.$ts"
  cp "$f" "$config/$f"
  echo "restored $config/$f"
done

echo "restart the shell to load new plugins: omarchy restart shell"
