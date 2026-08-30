-- Keep only your personal input overrides here. Uncommented settings below
-- replace Omarchy's defaults.

-- Keyboard layout and options.
-- See https://wiki.hypr.land/Configuring/Basics/Variables/#input
hl.config({
  input = {
    touchpad = {
      -- Use natural (inverse) scrolling.
      natural_scroll = true,

      -- Control the speed of scrolling (0.0-1.0). Omarchy's default is 0.4;
      -- lowered further here since Apple trackpads report faster deltas.
      scroll_factor = 0.2,
    },
  },
})

-- App-specific touchpad scroll speeds.
-- o.window("(Alacritty|kitty|foot)", { scroll_touchpad = 1.5 })
-- o.window("com.mitchellh.ghostty", { scroll_touchpad = 0.2 })

-- Enable touchpad gestures for changing workspaces.
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Gestures/
-- hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })

-- Enable touchpad gestures for moving focus (helpful on scrolling layout).
-- hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.focus({ direction = "l" })) end })
-- hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.focus({ direction = "r" })) end })

-- Two-finger swipe to navigate back/forward (e.g. in browsers), by sending
-- Alt+Left / Alt+Right to the focused window.
-- If the direction feels backwards on your trackpad, swap "left"/"right" below.
hl.gesture({ fingers = 2, direction = "left", action = function() hl.dispatch(hl.dsp.send_shortcut({ mods = "ALT", key = "left" })) end })
hl.gesture({ fingers = 2, direction = "right", action = function() hl.dispatch(hl.dsp.send_shortcut({ mods = "ALT", key = "right" })) end })

-- Three-finger swipe to move to the previous/next tab, by sending
-- Ctrl+PageUp / Ctrl+PageDown to the focused window (supported by most
-- browsers and terminals for tab switching).
-- If the direction feels backwards on your trackpad, swap "left"/"right" below.
hl.gesture({ fingers = 3, direction = "left", action = function() hl.dispatch(hl.dsp.send_shortcut({ mods = "CTRL", key = "Prior" })) end })
hl.gesture({ fingers = 3, direction = "right", action = function() hl.dispatch(hl.dsp.send_shortcut({ mods = "CTRL", key = "Next" })) end })
