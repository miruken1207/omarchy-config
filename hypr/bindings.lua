-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Omarchy menu on SUPER+M, keyboard layout switching on SUPER+SPACE.
hl.unbind("SUPER + SPACE")
o.bind("SUPER + M", "Omarchy menu", "omarchy-menu toggle")
o.bind("SUPER + SPACE", "Switch keyboard layout", "hyprctl switchxkblayout all next")

-- Workspace layout toggle (dwindle/scrolling) moved from SUPER+L to SUPER+SHIFT+L.
hl.unbind("SUPER + L")
o.bind("SUPER + SHIFT + L", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle")

-- Keybindings list on SUPER+L (SUPER+K still works too).
o.bind("SUPER + L", "Keybindings", "omarchy-menu-keybindings")

-- Named "home" workspace (desktop widgets live there), shown first in the bar.
o.bind("SUPER + grave", "Home workspace", hl.dsp.focus({ workspace = "name:home" }))
o.bind("SUPER + H", "Home workspace", hl.dsp.focus({ workspace = "name:home" }))
o.bind("ALT + grave", "Move window to home workspace", hl.dsp.window.move({ workspace = "name:home" }))
o.bind("SUPER + ALT + grave", "Edit desktop widgets", "/home/miruken/.local/bin/desktop-widgets-edit")

-- Step through home + workspaces 1-10 (including empty ones): SUPER+J previous, SUPER+K next.
hl.unbind("SUPER + J")
hl.unbind("SUPER + K")
o.bind("SUPER + J", "Previous workspace", "/home/miruken/.local/bin/workspace-step prev")
o.bind("SUPER + K", "Next workspace", "/home/miruken/.local/bin/workspace-step next")

-- Toggle window split moved from SUPER+J to SUPER+SHIFT+J.
o.bind("SUPER + SHIFT + J", "Toggle window split", hl.dsp.layout("togglesplit"))

-- Move the active window through workspaces 1-10: ALT+J previous, ALT+K next.
o.bind("ALT + J", "Move window to previous workspace", "/home/miruken/.local/bin/workspace-step prev move")
o.bind("ALT + K", "Move window to next workspace", "/home/miruken/.local/bin/workspace-step next move")

-- Swap SUPER+F (was full screen) and SUPER+ALT+F (was full width).
hl.unbind("SUPER + F")
hl.unbind("SUPER + ALT + F")
o.bind("SUPER + F", "Full width", hl.dsp.window.fullscreen({ mode = "maximized" }))
o.bind("SUPER + ALT + F", "Full screen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Yandex Music on SUPER+SHIFT+Y (replaces the YouTube web app binding).
hl.unbind("SUPER + SHIFT + Y")
o.bind("SUPER + SHIFT + Y", "Yandex Music", { launch = "/opt/yandex-music/yandexmusic --gtk-version=3" })

-- Move window to workspace N (focus follows): moved from SUPER+SHIFT+N to ALT+N.
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  hl.unbind("SUPER + SHIFT + " .. key)
  o.bind("ALT + " .. key, "Move window to workspace " .. workspace, hl.dsp.window.move({ workspace = tostring(workspace) }))
end

-- SUPER+scroll steps through workspaces 1-10 including empty ones (same as SUPER+J/K).
hl.unbind("SUPER + mouse_down")
hl.unbind("SUPER + mouse_up")
o.bind("SUPER + mouse_down", "Next workspace", "/home/miruken/.local/bin/workspace-step next")
o.bind("SUPER + mouse_up", "Previous workspace", "/home/miruken/.local/bin/workspace-step prev")

o.bind("SUPER + A", "Filmstrip", "omarchy-shell shell toggle io.github.florinbaci.filmstrip")

-- Telegram on SUPER+T; floating/tiling toggle moved to SUPER+SHIFT+T.
hl.unbind("SUPER + T")
o.bind("SUPER + T", "Telegram", { launch = "telegram-desktop" })
o.bind("SUPER + SHIFT + T", "Toggle window floating/tiling", hl.dsp.window.float({ action = "toggle" }))

-- YouTube web app on SUPER+Y.
hl.unbind("SUPER + Y")
o.bind("SUPER + Y", "YouTube", { launch = "omarchy-launch-webapp https://www.youtube.com/" })

-- Obsidian on SUPER+O; "pop window out" moved to SUPER+SHIFT+O.
hl.unbind("SUPER + O")
hl.unbind("SUPER + SHIFT + O")
o.bind("SUPER + O", "Obsidian", { launch = "obsidian", focus = "^obsidian$" })
o.bind("SUPER + SHIFT + O", "Pop window out (float & pin)", "omarchy-hyprland-window-pop")

-- Claude Desktop on SUPER+SHIFT+C (replaces Calendar).
hl.unbind("SUPER + SHIFT + C")
o.bind("SUPER + SHIFT + C", "Claude", { launch = "claude-desktop", focus = "^com\\.anthropic\\.Claude$" })

-- Happ (xray VPN client) on SUPER+SHIFT+H.
o.bind("SUPER + SHIFT + H", "Happ", { launch = "happ" })

-- Zed editor on SUPER+SHIFT+Z.
o.bind("SUPER + SHIFT + Z", "Zed", { launch = "zeditor", focus = "^dev\\.zed\\.Zed$" })

-- PyCharm on SUPER+SHIFT+P (replaces Google Photos).
hl.unbind("SUPER + SHIFT + P")
o.bind("SUPER + SHIFT + P", "PyCharm", { launch = "/home/miruken/.local/share/JetBrains/Toolbox/scripts/pycharm", focus = "^jetbrains-pycharm$" })

-- Flea file manager on SUPER+SHIFT+F (replaces Nautilus).
hl.unbind("SUPER + SHIFT + F")
o.bind("SUPER + SHIFT + F", "File manager", { launch = "flea --gui" })

-- Gona Launcher on SUPER+TAB (replaces Next workspace; was Super alone).
hl.unbind("SUPER + TAB")
o.bind("SUPER + TAB", "Gona Launcher", "omarchy-shell shell toggle gona.launcher")

-- Volume on ALT+= (up) and ALT+- (down).
o.bind("ALT + EQUAL", "Volume up", "omarchy-audio-output-volume raise", { locked = true, repeating = true })
o.bind("ALT + MINUS", "Volume down", "omarchy-audio-output-volume lower", { locked = true, repeating = true })

-- Brightness on ALT+] (up) and ALT+[ (down). Keycodes so they also work on the ru layout.
o.bind("ALT + code:35", "Brightness up", "omarchy-brightness-display +5%", { locked = true, repeating = true })
o.bind("ALT + code:34", "Brightness down", "omarchy-brightness-display 5%-", { locked = true, repeating = true })
