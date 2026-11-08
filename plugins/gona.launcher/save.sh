#!/bin/bash
# Copy the live launcher config into this repo (run before committing).
set -e
cd "$(dirname "$0")"
cp ~/.config/gona-launcher/config.toml config.toml
git status --short .
