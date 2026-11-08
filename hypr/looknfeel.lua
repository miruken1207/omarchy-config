-- Change the default Omarchy look'n'feel.

-- https://wiki.hypr.land/Configuring/Basics/Variables/#general
-- hl.config({
--   general = {
--     -- No gaps between windows or borders.
--     gaps_in = 0,
--     gaps_out = 0,
--     border_size = 0,
--
--     -- Change to niri-like side-scrolling layout.
--     layout = "scrolling",
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
-- hl.config({
--   decoration = {
--     -- Use round window corners.
--     rounding = 8,
--
--     -- Dim unfocused windows (0.0 = no dim, 1.0 = fully dimmed).
--     dim_inactive = true,
--     dim_strength = 0.15,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#animations
-- hl.config({
--   animations = {
--     -- Disable all animations.
--     enabled = false,
--   },
-- })

-- https://wiki.hypr.land/Configuring/Basics/Variables/#layout
-- hl.config({
--   layout = {
--     -- Avoid overly wide single-window layouts on wide screens.
--     single_window_aspect_ratio = { 1, 1 },
--   },
-- })

-- https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/
-- hl.config({
--   scrolling = {
--     -- See only one column per screen instead of two.
--     column_width = 0.97,
--   },
-- })

-- Smooth horizontal slide when switching workspaces (Omarchy disables this by default).
hl.curve("smoothSlide", { type = "bezier", points = { { 0.22, 1 }, { 0.36, 1 } } })
hl.animation({ leaf = "workspaces", enabled = true, speed = 4, bezier = "smoothSlide", style = "slide" })

-- >>> omaland managed block >>>
-- Written by Omaland. Safe to hand-edit: Omaland re-reads this block
-- every time it opens, and only ever rewrites what's between the fences.
hl.config({
  decoration = {
    rounding = 10,
    rounding_power = 10,
  },
})
-- <<< omaland managed block <<<

-- Glass effect for Gona Launcher: blur is off in the Omarchy defaults, so turn it on and blur only this layer.
hl.config({
  decoration = {
    blur = {
      enabled = true,
      size = 10,
      passes = 3,
      noise = 0.02,
      brightness = 1.0,
    },
  },
})
hl.layer_rule({ match = { namespace = "^gona-launcher$" }, blur = true, ignore_alpha = 0.05 })

-- Glass effect for the Omarchy bar: blur behind its translucent background (alpha set in ~/.config/omarchy/shell.toml).
hl.layer_rule({ match = { namespace = "^omarchy-bar$" }, blur = true, ignore_alpha = 0.05 })

-- Glass effect for the home-workspace gadgets (omagadgets plugin).
hl.layer_rule({ match = { namespace = "^miruken1207-omagadgets$" }, blur = true, ignore_alpha = 0.1 })
