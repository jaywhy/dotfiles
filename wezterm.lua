local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Hack Nerd Font Mono")
config.font_size = 19

config.window_decorations = "RESIZE"
config.color_scheme = "Catppuccin Mocha"

return config
