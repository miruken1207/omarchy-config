# Keybindings

Hyprland keybindings on top of a stock [Omarchy](https://omarchy.org/) install (4.0.6).
Only files that differ from the Omarchy defaults are kept here.

## Restore on a fresh install

```bash
git clone git@github.com:miruken1207/omarchy-config.git ~/omarchy-config
~/omarchy-config/bindings/install.sh
```

`install.sh` backs up any existing file as `*.bak.<timestamp>`, copies the repo
files into place and reloads Hyprland.

## Save changes

```bash
~/omarchy-config/bindings/save.sh   # copy live config into the repo
git -C ~/omarchy-config commit -am "..." && git -C ~/omarchy-config push
```

## Contents

| Repo file | Installed to |
|-----------|--------------|
| `hypr/bindings.lua` | `~/.config/hypr/bindings.lua` |
| `bin/workspace-step` | `~/.local/bin/workspace-step` |

## Keybindings

Personal bindings live below the stock Omarchy header in `hypr/bindings.lua`,
grouped into the same sections as here (System, Volume & brightness, Windows,
Workspaces, Apps).

### Workspaces

| Keys | Action | Stock binding moved to |
|------|--------|------------------------|
| `SUPER + grave` / `SUPER + H` | Focus the named `home` workspace | |
| `ALT + grave` | Move window to `home` | |
| `SUPER + ALT + grave` | Edit omagadgets (drag/resize the home cards) | |
| `SUPER + J` / `SUPER + K` | Previous / next workspace (home, 1–10, empty ones too) | toggle split → `SUPER + SHIFT + J` |
| `SUPER + scroll` | Same as `SUPER + J/K` | |
| `ALT + J` / `ALT + K` | Move window to previous / next workspace | |
| `ALT + 1..0` | Move window to workspace N (focus follows) | was `SUPER + SHIFT + 1..0` |
| `SUPER + SHIFT + L` | Toggle workspace layout (dwindle/scrolling) | was `SUPER + L` |

### Windows

| Keys | Action |
|------|--------|
| `SUPER + F` | Full width (maximized) — swapped with `SUPER + ALT + F` |
| `SUPER + ALT + F` | Full screen |
| `SUPER + SHIFT + T` | Toggle floating/tiling (was `SUPER + T`) |
| `SUPER + SHIFT + O` | Pop window out (float & pin) |

### System

| Keys | Action |
|------|--------|
| `SUPER + M` | Omarchy menu |
| `SUPER + SPACE` | Switch keyboard layout |
| `SUPER + L` | Keybindings list |
| `SUPER + TAB` | Gona Launcher |
| `SUPER + A` | Filmstrip |
| `ALT + =` / `ALT + -` | Volume up / down |
| `ALT + ]` / `ALT + [` | Brightness up / down (keycodes, work on the ru layout) |

### Apps

| Keys | App |
|------|-----|
| `SUPER + T` | Telegram |
| `SUPER + O` | Obsidian |
| `SUPER + Y` | YouTube (web app) |
| `SUPER + SHIFT + Y` | Yandex Music |
| `SUPER + SHIFT + C` | Claude Desktop |
| `SUPER + SHIFT + H` | Happ (VPN) |
| `SUPER + SHIFT + Z` | Zed |
| `SUPER + SHIFT + P` | PyCharm |
| `SUPER + SHIFT + F` | Flea file manager |

## Dependencies

Some bindings call things that are not part of stock Omarchy:

- Apps: `telegram-desktop`, `obsidian`, Yandex Music (`/opt/yandex-music`),
  `claude-desktop`, `happ`, `zeditor`, PyCharm via JetBrains Toolbox, `flea`.
- Shell plugins: `gona.launcher`, `io.github.florinbaci.filmstrip`,
  `miruken1207.omagadgets` (home workspace gadgets; its edit script ships with the plugin).
- Scripts are looked up in `~/.local/bin` (via `$HOME`), so any Linux username works.
