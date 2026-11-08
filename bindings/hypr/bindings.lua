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
-- ============================================================================
-- Personal bindings
-- Sections: System, Volume & brightness, Windows, Workspaces, Apps.
-- Within a section, defaults are unbound first, then keys are bound again.
-- ============================================================================

local bin = os.getenv("HOME") .. "/.local/bin/"

-- ---------------------------------------------------------------------------
-- System
-- ---------------------------------------------------------------------------

hl.unbind("SUPER + SPACE") -- was: launcher
hl.unbind("SUPER + L")     -- was: toggle workspace layout (now SUPER+SHIFT+L)
hl.unbind("SUPER + TAB")   -- was: next workspace

o.bind("SUPER + M", "Omarchy menu", "omarchy-menu toggle")
o.bind("SUPER + SPACE", "Switch keyboard layout", "hyprctl switchxkblayout all next")
o.bind("SUPER + L", "Keybindings", "omarchy-menu-keybindings")
o.bind("SUPER + TAB", "Gona Launcher", "omarchy-shell shell toggle gona.launcher")
o.bind("SUPER + A", "Filmstrip", "omarchy-shell shell toggle io.github.florinbaci.filmstrip")

-- ---------------------------------------------------------------------------
-- Volume & brightness (ALT + = - ] [; keycodes so they also work on the ru layout)
-- ---------------------------------------------------------------------------

o.bind("ALT + EQUAL", "Volume up", "omarchy-audio-output-volume raise", { locked = true, repeating = true })
o.bind("ALT + MINUS", "Volume down", "omarchy-audio-output-volume lower", { locked = true, repeating = true })
o.bind("ALT + code:35", "Brightness up", "omarchy-brightness-display +5%", { locked = true, repeating = true })
o.bind("ALT + code:34", "Brightness down", "omarchy-brightness-display 5%-", { locked = true, repeating = true })

-- ---------------------------------------------------------------------------
-- Windows
-- ---------------------------------------------------------------------------

hl.unbind("SUPER + F")         -- was: full screen (swapped with SUPER+ALT+F)
hl.unbind("SUPER + ALT + F")   -- was: full width
hl.unbind("SUPER + SHIFT + O") -- was: Obsidian (now SUPER+O)

o.bind("SUPER + F", "Full width", hl.dsp.window.fullscreen({ mode = "maximized" }))
o.bind("SUPER + ALT + F", "Full screen", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
o.bind("SUPER + SHIFT + T", "Toggle window floating/tiling", hl.dsp.window.float({ action = "toggle" })) -- was SUPER+T
o.bind("SUPER + SHIFT + O", "Pop window out (float & pin)", "omarchy-hyprland-window-pop")             -- was SUPER+O
o.bind("SUPER + SHIFT + J", "Toggle window split", hl.dsp.layout("togglesplit"))                        -- was SUPER+J

-- ---------------------------------------------------------------------------
-- Workspaces
-- Named "home" workspace (desktop widgets) comes before 1; workspace-step
-- cycles home, 1..10 including empty ones.
-- ---------------------------------------------------------------------------

hl.unbind("SUPER + J") -- was: toggle split (now SUPER+SHIFT+J)
hl.unbind("SUPER + K") -- was: keybindings (now SUPER+L)
hl.unbind("SUPER + mouse_down")
hl.unbind("SUPER + mouse_up")

-- Home
o.bind("SUPER + grave", "Home workspace", hl.dsp.focus({ workspace = "name:home" }))
o.bind("SUPER + H", "Home workspace", hl.dsp.focus({ workspace = "name:home" }))
o.bind("ALT + grave", "Move window to home workspace", hl.dsp.window.move({ workspace = "name:home" }))
o.bind("SUPER + ALT + grave", "Edit desktop widgets", bin .. "desktop-widgets-edit")

-- Step through workspaces: SUPER+J/K or SUPER+scroll focus, ALT+J/K move the window
o.bind("SUPER + J", "Previous workspace", bin .. "workspace-step prev")
o.bind("SUPER + K", "Next workspace", bin .. "workspace-step next")
o.bind("SUPER + mouse_up", "Previous workspace", bin .. "workspace-step prev")
o.bind("SUPER + mouse_down", "Next workspace", bin .. "workspace-step next")
o.bind("ALT + J", "Move window to previous workspace", bin .. "workspace-step prev move")
o.bind("ALT + K", "Move window to next workspace", bin .. "workspace-step next move")

-- Move window to workspace N (focus follows): ALT+N instead of SUPER+SHIFT+N
for workspace = 1, 10 do
  local key = "code:" .. tostring(workspace + 9)
  hl.unbind("SUPER + SHIFT + " .. key)
  o.bind("ALT + " .. key, "Move window to workspace " .. workspace, hl.dsp.window.move({ workspace = tostring(workspace) }))
end

o.bind("SUPER + SHIFT + L", "Toggle workspace layout", "omarchy-hyprland-workspace-layout-toggle") -- was SUPER+L

-- ---------------------------------------------------------------------------
-- Apps
-- ---------------------------------------------------------------------------

hl.unbind("SUPER + T")         -- was: toggle floating (now SUPER+SHIFT+T)
hl.unbind("SUPER + O")         -- was: pop window out (now SUPER+SHIFT+O)
hl.unbind("SUPER + Y")
hl.unbind("SUPER + SHIFT + Y") -- was: YouTube
hl.unbind("SUPER + SHIFT + C") -- was: Calendar
hl.unbind("SUPER + SHIFT + P") -- was: Google Photos
hl.unbind("SUPER + SHIFT + F") -- was: Nautilus

o.bind("SUPER + T", "Telegram", { launch = "telegram-desktop" })
o.bind("SUPER + O", "Obsidian", { launch = "obsidian", focus = "^obsidian$" })
o.bind("SUPER + Y", "YouTube", { launch = "omarchy-launch-webapp https://www.youtube.com/" })
o.bind("SUPER + SHIFT + Y", "Yandex Music", { launch = "/opt/yandex-music/yandexmusic --gtk-version=3" })
o.bind("SUPER + SHIFT + C", "Claude", { launch = "claude-desktop", focus = "^com\\.anthropic\\.Claude$" })
o.bind("SUPER + SHIFT + H", "Happ", { launch = "happ" })
o.bind("SUPER + SHIFT + Z", "Zed", { launch = "zeditor", focus = "^dev\\.zed\\.Zed$" })
o.bind("SUPER + SHIFT + P", "PyCharm", { launch = os.getenv("HOME") .. "/.local/share/JetBrains/Toolbox/scripts/pycharm", focus = "^jetbrains-pycharm$" })
o.bind("SUPER + SHIFT + F", "File manager", { launch = "flea --gui" })
