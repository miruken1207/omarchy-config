#!/bin/bash
# Copy the live config into this repo (run before committing).
set -e
cd "$(dirname "$0")"
cp ~/.config/hypr/bindings.lua hypr/bindings.lua
cp ~/.local/bin/workspace-step bin/workspace-step
git status --short
