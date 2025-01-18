local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.font = wezterm.font("Hack Nerd Font")
config.font_size = 19

config.window_decorations = "RESIZE"
config.color_scheme = "Catppuccin Mocha"
config.hide_tab_bar_if_only_one_tab = true

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = {
	{
		key = "|",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "-",
		mods = "LEADER",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "z",
		mods = "LEADER",
		action = wezterm.action.TogglePaneZoomState,
	},
}

return config
