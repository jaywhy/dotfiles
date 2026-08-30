-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
-- List current monitors and supported resolutions with: hyprctl monitors all

local omarchy_gdk_scale = 2
local omarchy_monitor_scale = 1.6

hl.env("GDK_SCALE", tostring(omarchy_gdk_scale))
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = omarchy_monitor_scale })

-- DP-1 (LG UltraGear+): 10-bit sRGB for accurate SDR colors. render:cm_auto_hdr
-- (on by default) still flips the panel to HDR for fullscreen HDR surfaces and
-- back on exit. cm = "auto"/"wide" would remap SDR into BT.2020 and look washed
-- out on this panel, so keep it "srgb".
hl.monitor({ output = "DP-1", mode = "preferred", position = "auto", scale = omarchy_monitor_scale, bitdepth = 10, cm = "srgb" })

-- Configure a specific monitor.
-- hl.monitor({ output = "DP-2", mode = "2560x1440@144", position = "0x0", scale = 1 })

-- Portrait/rotated secondary monitor (transform: 1 = 90°, 3 = 270°).
-- hl.monitor({ output = "DP-2", mode = "preferred", position = "auto", scale = 1, transform = 1 })
