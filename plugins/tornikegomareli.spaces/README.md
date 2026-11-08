# Spaces — local patch

**Original plugin:** [Spaces](https://github.com/tornikegomareli/omarchy-spaces)
by **Tornike Gomareli**, MIT License (see [`LICENSE`](LICENSE)).

This directory does **not** contain the plugin itself, only my changes to it as a
patch (`home-workspace.patch`). The plugin is installed from its upstream
repository and the patch is applied on top.

Patch base: v1.6.0 (`458852c`).

## What the patch changes

- **Named `home` workspace** in the bar: pinned before workspace 1, shown as a
  house icon (`󰋜`), and clicking it focuses `name:home`. Hyprland gives named
  workspaces negative ids, so the stock widget hid it.
- **Workspace 10 is labelled `10`** instead of `0`, both on the pill and in the
  hover preview title.

Files touched: `Spaces.qml`, `Model.js`.

## Install

```bash
~/omarchy-config/plugins/tornikegomareli.spaces/install.sh
omarchy restart shell
```

`install.sh` adds the plugin with `omarchy plugin add` if it is missing, then
applies the patch. It is safe to re-run: an already applied patch is skipped. If
upstream has changed, it falls back to a 3-way merge.

The plugin's bar placement and settings live in `~/.config/omarchy/shell.json`.

## After `omarchy plugin update`

Updating the plugin resets its files and drops the patch. Re-run `install.sh`.

## Save changes

After editing the live plugin in `~/.config/omarchy/plugins/tornikegomareli.spaces/`:

```bash
~/omarchy-config/plugins/tornikegomareli.spaces/save.sh
```

This regenerates the patch from the plugin's uncommitted changes.
