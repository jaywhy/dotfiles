-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")
o.bind("SUPER + M", "Toggle master layout", "omarchy-hyprland-workspace-master-toggle")
-- Only takes effect once you're in master layout (SUPER + M above); dwindle
-- has no exact-ratio dispatcher, only master's mfact does. Toggles the 2/3
-- pane between left and right on each press (state resets on reload/restart).
local master_on_right = false
o.bind("SUPER + CTRL + M", "Master pane to 2/3 width (toggle side)", function()
  master_on_right = not master_on_right
  hl.dispatch(hl.dsp.layout(master_on_right and "orientationright" or "orientationleft"))
  hl.dispatch(hl.dsp.layout("mfact exact 0.6667"))
end)
o.bind("SUPER + SHIFT + A", "Anki", { launch = "anki", focus = "Anki" })
o.bind("SUPER + SHIFT + C", "Claude", { webapp = "https://claude.ai" })
o.bind("SUPER + SHIFT + O", "Obsidian", { launch = "obsidian", focus = "^md\\.obsidian\\.Obsidian$" })
o.bind("SUPER + SHIFT + SLASH", "Passwords", { omarchy = "1password" })
o.bind("SUPER + SHIFT + W", "Typora", { launch = "typora", focus = "^typora$" })
o.bind("SUPER + SHIFT + T", "TickTick", { launch = "ticktick", focus = "^ticktick$" })

-- TickTick "quick add": focus (or launch) TickTick, then fire its in-app
-- new-task shortcut. Recreates the macOS global Quick Add action. The Linux
-- app has no floating quick-add, so this raises the window.
-- Adjust QUICK_ADD_KEYS if TickTick's shortcut differs on your account.
local QUICK_ADD_KEYS = { "Tab", "n" }
local function ticktick_quick_add()
  hl.exec_cmd("omarchy-launch-or-focus '^ticktick$' " .. "'uwsm-app -- ticktick'")
  local delay = 120
  for _, key in ipairs(QUICK_ADD_KEYS) do
    hl.timer(function()
      hl.dispatch(hl.dsp.send_key_state({ mods = "", key = key, state = "down" }))
      hl.timer(function()
        hl.dispatch(hl.dsp.send_key_state({ mods = "", key = key, state = "up" }))
      end, { timeout = 40, type = "oneshot" })
    end, { timeout = delay, type = "oneshot" })
    delay = delay + 80
  end
end
o.bind("SUPER + CTRL + ALT + SHIFT + T", "TickTick quick add", ticktick_quick_add)

-- Scratchpad apps (Discord, Spotify): launch hidden on first use, then
-- show/hide with a single keypress. Each is routed into its own named
-- special workspace by hypr/windows.lua, so the two toggle independently
-- of each other and of the default SUPER+S scratchpad.
-- class_pattern is a Lua pattern matched against win.class. Discord is a
-- browser --app webapp whose class carries a browser prefix
-- (brave-/chrome-/chromium-...) that changes with the default browser, so
-- match the URL-derived suffix, not the whole string -- otherwise the
-- "already running?" check fails and every keypress launches another copy.
local function toggle_scratchpad(name, class_pattern, launch_cmd)
  return function()
    local running = false
    for _, win in pairs(hl.get_windows()) do
      if win.class and win.class:match(class_pattern) then
        running = true
        break
      end
    end
    if not running then
      hl.exec_cmd(launch_cmd)
    end
    hl.dispatch(hl.dsp.workspace.toggle_special(name))
  end
end

local discord_scratchpad = toggle_scratchpad(
  "discord",
  "%-discord%.com__channels_@me%-Default$",
  o.launch("omarchy-launch-webapp https://discord.com/channels/@me")
)
local spotify_scratchpad = toggle_scratchpad("spotify", "^Spotify$", o.launch("/usr/bin/spotify"))

-- Hyper (Capslock) + letter: one consistent scheme for both.
o.bind("SUPER + CTRL + ALT + SHIFT + D", "Toggle Discord scratchpad", discord_scratchpad)
o.bind("SUPER + CTRL + ALT + SHIFT + S", "Toggle Spotify scratchpad", spotify_scratchpad)

-- Repointed from their old direct-launch bindings so they don't spawn a
-- second, unmanaged window alongside the scratchpad one.
-- Was: o.bind("SUPER + SHIFT + M", "Music", { omarchy = "spotify" })
o.bind("SUPER + SHIFT + M", "Toggle Spotify scratchpad", spotify_scratchpad)
-- Was: o.bind("SUPER + SHIFT + E", "Email", { webapp = "https://gmail.com" })
o.bind("SUPER + SHIFT + E", "Fastmail", { launch = "fastmail", focus = "^com\\.fastmail\\.Fastmail$" })

-- Toggle the focused window into a floating column centered on its monitor
-- at 2/3 width, filling the height below the top bar (press again to
-- return it to tiling). Monitor size is hardcoded for a 5120x2160 display
-- at 1.6 scale (logical 3200x1350); the top bar's presence/height is read
-- live each time, since the bar doesn't reserve screen space and can be
-- hidden (auto-hide or SUPER+SHIFT+SPACE) without Hyprland knowing.
o.bind("SUPER + ALT + C", "Center window (2/3 width)", function()
  local was_floating = hl.get_active_window().floating
  hl.dispatch(hl.dsp.window.float({ action = "toggle" }))
  if was_floating then
    return
  end

  local mon_w, mon_h, gap = 3200, 1350, 10

  local bar_offset = 0
  for _, layer in ipairs(hl.get_layers()) do
    if layer.namespace == "omarchy-bar" and layer.y >= 0 then
      bar_offset = layer.h
      break
    end
  end

  local width = 2133
  local height = mon_h - bar_offset - 2 * gap
  local x = math.floor((mon_w - width) / 2)
  local y = bar_offset + gap

  hl.dispatch(hl.dsp.window.resize({ x = width, y = height }))
  hl.dispatch(hl.dsp.window.move({ x = x, y = y }))
end)

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

o.bind("SUPER + SHIFT + CTRL + F", "File search (plocate)", "omarchy-shell shell toggle jaywhy.plocate-search")
