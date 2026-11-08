#!/bin/bash
# Install Gona Launcher (if missing) and restore its config.
# An existing config is backed up as config.toml.bak.<timestamp>.
set -e
cd "$(dirname "$0")"
plugin=~/.config/omarchy/plugins/gona.launcher
config=~/.config/gona-launcher/config.toml

if [[ ! -d $plugin ]]; then
  omarchy plugin add https://github.com/Mgldvd/gona-launcher.git --yes
fi

mkdir -p "$(dirname "$config")"
[[ -e $config ]] && cp "$config" "$config.bak.$(date +%s)"
cp config.toml "$config"
echo "restored $config"
