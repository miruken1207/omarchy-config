# omarchy-config

My customizations on top of a stock [Omarchy](https://omarchy.org/) install (4.0.6).
Each directory is self-contained, with its own `README.md`, `install.sh` and `save.sh`.

| Directory | What |
|-----------|------|
| [`bindings/`](bindings/) | Hyprland keybindings and the `workspace-step` script |
| [`plugins/tornikegomareli.spaces/`](plugins/tornikegomareli.spaces/) | Patch for [Spaces](https://github.com/tornikegomareli/omarchy-spaces) by Tornike Gomareli: `home` workspace in the bar |
| [`plugins/gona.launcher/`](plugins/gona.launcher/) | Config for [Gona Launcher](https://github.com/Mgldvd/gona-launcher) by Mgldvd: glass look, pinned tiles |

## Restore on a fresh install

```bash
git clone git@github.com:miruken1207/omarchy-config.git ~/omarchy-config
~/omarchy-config/bindings/install.sh
~/omarchy-config/plugins/tornikegomareli.spaces/install.sh
~/omarchy-config/plugins/gona.launcher/install.sh
omarchy restart shell
```

Third-party plugins are stored only as my patches or config files, crediting the
original author (a patch also ships the author's license); the plugins themselves
come from their upstream repositories.
