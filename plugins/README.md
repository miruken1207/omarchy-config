# Plugins

Omarchy shell plugins on this machine (Omarchy 4.0.6), as of 2026-11-08.
All installed plugins live in `~/.config/omarchy/plugins/`; which ones are on and
where they sit is set in `~/.config/omarchy/shell.json`.

Sub-directories here hold my changes to a plugin (a patch or its config file).
Plugins without a directory are used as they come from upstream, only with
settings in `shell.json`.

## Third-party plugins

All enabled. "Where" is the bar section (from `shell.json`), or `service` /
`overlay` / `panel` for plugins that are not bar widgets.

| Plugin | Author | Where | Installed | Saved here |
|--------|--------|-------|-----------|------------|
| [Spaces](https://github.com/tornikegomareli/omarchy-spaces) `tornikegomareli.spaces` | Tornike Gomareli | bar, left | v1.6.0 `458852c` | [patch](tornikegomareli.spaces/): `home` workspace, label 10 |
| [Gona Launcher](https://github.com/Mgldvd/gona-launcher) `gona.launcher` | Mgldvd | bar, center + overlay (`SUPER + TAB`) | v1.0.2 `b010d11` | [config](gona.launcher/): glass look, tiles |
| [Audio Visualizer](https://github.com/koyPhish/omarchy-audio-visualizer) `io.github.koyphish.audio-visualizer` | koyPhish | bar, center | 1.0.0 `bbec27f` | — (`style: grounded`, `autoHide: false`; replaces built-in `omarchy.audio`); needs `cava` |
| [Motion Wallpaper](https://github.com/28allday/Motion-Wallpaper-Omarchy) `nosignal.motion-wallpaper` | Gavin Nugent | bar, center + service | 0.4.0 `bacebac` | — |
| [Readout](https://github.com/sudoAPWH/omarchy-readout) `io.github.sudoapwh.readout` | Alexander Hutlet | bar, center | 1.0.0 `366bb7c` | — |
| [Radio Atlas](https://github.com/AksharP5/omarchy-radio-atlas) `akshar.radio-atlas` | Akshar Patel | bar, center + panel | 0.1.9 `cb604f7` | — |
| [Music Flow](https://github.com/Clifford-Baidoo/Omarchy-music-flow) `custom.media` | Clifford Baidoo | bar, center + service | 1.0.0 `42c312d` | — (replaces built-in `omarchy.media`) |
| [Filmstrip](https://github.com/florinbaci/omarchy-filmstrip) `io.github.florinbaci.filmstrip` | florinbaci | overlay (`SUPER + A`) | 1.3.0 `ef6f64f` | — |
| [Omaland](https://github.com/bobby-nicholas/omaland) `bobbynicholas.omaland` | Bobby Nicholas | panel + service | 1.0.0 `22e736a` | — (writes a block into `hypr/looknfeel.lua`) |
| [Lock Screen Explorer](https://github.com/SirJul1337/omarchy-lock-explorer) `io.github.sirjul1337.lock-explorer` | SirJul1337 | service + overlay | v2.0.10 `9f056d3` | — (`design: motion`; replaces built-in `omarchy.lock`; settings in `~/.config/omarchy/lock-explorer.json`) |

## My own plugins

| Plugin | Status | Where | Source |
|--------|--------|-------|--------|
| omanum `miruken1207.omanum` | enabled | service | [miruken1207/omanum](https://github.com/miruken1207/omanum), v1.1.0 `677432a` |
| Desktop `miruken.desktop` | enabled | service (widgets on the `home` workspace) | local only, moving to its own repo |
| My System tray `miruken.tray` | enabled | bar, right | clone of built-in `omarchy.tray` with local changes, not saved yet |
| My Workspaces `miruken.workspaces` | **disabled** | — | clone of built-in `omarchy.workspaces`; unused, replaced by Spaces |

## Built-in Omarchy plugins

Turned off or replaced compared with stock Omarchy:

| Plugin | Status | Replaced by |
|--------|--------|-------------|
| `omarchy.workspaces` | not in bar | Spaces |
| `omarchy.tray` | not in bar | `miruken.tray` |
| `omarchy.audio` | not in bar | Audio Visualizer (moved from right to center) |
| `omarchy.media` | disabled | Music Flow |
| `omarchy.lock` | disabled | Lock Screen Explorer |

Built-in bar widgets in use:

- **left:** `omarchy.menu`
- **center:** `omarchy.indicators` (`alwaysShow`), `omarchy.clock` (`dddd HH:mm`),
  `omarchy.keyboard-layout`, `omarchy.weather` (`metric`), `omarchy.system-update`
- **right:** `omarchy.agents`, `omarchy.network`, `omarchy.bluetooth`,
  `omarchy.monitor`, `omarchy.power`

## Reinstall a third-party plugin

```bash
omarchy plugin add <git-url> --yes
```
