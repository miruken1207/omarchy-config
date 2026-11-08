# Shell

Omarchy shell config: which plugins are on, the bar layout, plugin settings and
the bar's glass look.

| Repo file | Installed to | What |
|-----------|--------------|------|
| `shell.json` | `~/.config/omarchy/shell.json` | bar layout, enabled/disabled plugins, plugin settings, idle timers |
| `shell.toml` | `~/.config/omarchy/shell.toml` | bar background alpha (glass) |
| `plugins.txt` | — | git URLs of the third-party plugins `shell.json` uses |

The full plugin list with authors and versions is in [`../plugins/`](../plugins/).

## What differs from stock

**Bar** (top):

- **left:** Omarchy menu, Spaces (instead of the built-in workspaces): 10
  persistent workspaces, coloured app icons, numbers.
- **center:** indicators (always shown), Audio Visualizer (`grounded`, moved
  here from the right as a replacement for the built-in audio widget), clock
  (`dddd HH:mm`), keyboard layout, weather (metric), Omarchy update, Gona
  Launcher, Motion Wallpaper, Readout, Radio Atlas, Music Flow.
- **right:** `miruken.tray` (instead of the built-in tray), agents, network,
  bluetooth, display, power.

**Non-bar plugins:** Filmstrip, Omaland, Lock Screen Explorer (`motion` design,
opens as a panel), omagadgets, omanum.

**Disabled built-ins:** `omarchy.media` (replaced by Music Flow) and
`omarchy.lock` (replaced by Lock Screen Explorer).

**Glass bar:** `shell.toml` sets `background-alpha = 0.45`; the blur behind it
comes from a layer rule for `omarchy-bar` in `~/.config/hypr/looknfeel.lua`.

Idle timers are the Omarchy defaults (screensaver 150 s, lock 300 s).

## Install

```bash
~/omarchy-config/shell/install.sh
omarchy restart shell
```

1. Installs `cava` if missing (Audio Visualizer needs it).
2. Adds every plugin from `plugins.txt` that is not installed yet, with
   `omarchy plugin add --yes` (this only clones it; it does not enable it).
3. Copies `shell.json` and `shell.toml` into place, backing up existing files
   as `*.bak.<timestamp>`. `shell.json` turns the plugins on and lays out the bar.

Plugins are installed at their latest upstream version. The versions I used
are recorded in [`../plugins/README.md`](../plugins/README.md).

Run the plugin patch/config installers (`../plugins/*/install.sh`) after this
one: they expect the plugin to be there already, or add it themselves.

### Not installed by this script

`shell.json` also enables `miruken.tray`, my clone of the built-in tray, which
has no git repository yet. `install.sh` prints `MISSING:` for it; install it by
hand.

## Save changes

```bash
~/omarchy-config/shell/save.sh
```

Copies both files into the repo and warns about any non-Omarchy plugin in
`shell.json` that is missing from `plugins.txt`, so a newly added plugin is
not forgotten.
