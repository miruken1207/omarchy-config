#!/bin/bash
# Regenerate the patch from the live plugin's uncommitted changes.
set -e
cd "$(dirname "$0")"
plugin=~/.config/omarchy/plugins/tornikegomareli.spaces
git -C "$plugin" diff > home-workspace.patch
git -C "$plugin" log -1 --format='Patch base: %H (%s)'
git status --short .
