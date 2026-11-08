#!/bin/bash
# Install the upstream Spaces plugin (if missing) and apply the local patch.
set -e
cd "$(dirname "$0")"
patch=$PWD/home-workspace.patch
plugin=~/.config/omarchy/plugins/tornikegomareli.spaces
upstream=https://github.com/tornikegomareli/omarchy-spaces.git

if [[ ! -d $plugin ]]; then
  omarchy plugin add "$upstream" --yes
fi

cd "$plugin"
if git apply --reverse --check "$patch" 2>/dev/null; then
  echo "patch already applied"
elif git apply --check "$patch" 2>/dev/null; then
  git apply "$patch"
  echo "patch applied"
else
  # Upstream moved on: let git merge the changes against the original lines.
  git apply --3way "$patch"
  echo "patch applied with 3-way merge; check 'git -C $plugin status' for conflicts"
fi

echo "restart the shell to load it: omarchy restart shell"
