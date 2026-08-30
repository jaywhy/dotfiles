-- Personal window rules.
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Scratchpad apps: each lives in its own named special workspace so it can
-- be shown/hidden independently (see the Hyper+D/S toggles in
-- hypr/bindings.lua). They're launched hidden -- either at startup
-- (hypr/autostart.lua) or lazily on first toggle -- and this rule is what
-- routes them into their special workspace, floated and sized/centered,
-- instead of landing on a normal tiling workspace.
--
-- Classes were captured live via `hyprctl clients -j`. Discord is a browser
-- --app webapp, so its class encodes the launch URL after a
-- browser-dependent prefix: brave-/chrome-/chromium-... Match any prefix.

-- OneDriveGUI: float it like a popup instead of tiling it into the layout.
o.window({ class = "^OneDriveGUI$" }, {
  float = true,
  center = true,
})

local scratchpad_size = { 1400, 900 }

o.window({ class = "^[a-z]+-discord\\.com__channels_@me-Default$" }, {
  workspace = "special:discord silent",
  float = true,
  center = true,
  size = scratchpad_size,
  no_initial_focus = true,
})

o.window({ class = "^Spotify$" }, {
  workspace = "special:spotify silent",
  float = true,
  center = true,
  size = scratchpad_size,
  no_initial_focus = true,
})
