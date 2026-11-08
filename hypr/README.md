# Hyprland

Hyprland overrides on top of the Omarchy defaults. Each file is the stock
Omarchy user file (commented-out examples included) with my changes appended
at the end. Keybindings are in [`../bindings/`](../bindings/).

| Repo file | Installed to |
|-----------|--------------|
| `hyprland.lua` | `~/.config/hypr/hyprland.lua` |
| `input.lua` | `~/.config/hypr/input.lua` |
| `looknfeel.lua` | `~/.config/hypr/looknfeel.lua` |

`monitors.lua` and `autostart.lua` are untouched stock files, so they are not kept.

## What is customized

### `input.lua` — keyboard and touchpad

- Layouts **us + ru**, switched with Left Alt + Right Alt (`grp:alts_toggle`);
  `SUPER + SPACE` also switches (see bindings). Caps Lock is Compose, both
  Shifts cancel Caps Lock.
- **Natural scrolling** on the touchpad.

### `looknfeel.lua` — look

- **Workspace switch animation:** smooth horizontal slide (`smoothSlide` bezier,
  speed 4). Omarchy turns workspace animation off by default.
- **Rounded corners:** `rounding = 10`, `rounding_power = 10`. This block is
  managed by the [Omaland](https://github.com/bobby-nicholas/omaland) plugin:
  it rewrites only what is between the `omaland managed block` fences.
- **Glass (blur):** blur is off in the Omarchy defaults. It is turned on once
  (size 10, 3 passes, noise 0.02) and applied to three layers only:

  | Layer | What | Its transparency comes from |
  |-------|------|-----------------------------|
  | `gona-launcher` | Gona Launcher | [`../plugins/gona.launcher/config.toml`](../plugins/gona.launcher/) |
  | `omarchy-bar` | the bar | [`../shell/shell.toml`](../shell/) |
  | `miruken-desktop` | home workspace widgets | the `miruken.desktop` plugin |

### `hyprland.lua` — misc

- Screenshots go to `~/Pictures/Screenshots` (`install.sh` creates the folder).
- More transparent windows: foot terminal `0.8 / 0.7`, Zed `0.9 / 0.8`
  (active / inactive).
- No Hyprland fade on the omanum OSD layer (`miruken1207-omanum`), since
  [omanum](https://github.com/miruken1207/omanum) animates itself.

## Install

```bash
~/omarchy-config/hypr/install.sh
```

Copies the three files into `~/.config/hypr/` (existing ones are backed up as
`*.bak.<timestamp>`), creates the screenshots folder, reloads Hyprland and
prints config errors if there are any.

## Save changes

```bash
~/omarchy-config/hypr/save.sh
```
