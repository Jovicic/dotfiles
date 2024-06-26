-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- set terminal default size
config.initial_cols = 160
config.initial_rows = 40

-- set renderer
config.front_end = "WebGpu"

-- config.color_scheme = "Catppuccin Mocha"
config.color_scheme = "Catppuccin Macchiato"
-- config.color_scheme = "tokyonight_night"
-- config.color_scheme = "tokyonight_moon"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Everforest Dark (Gogh)"
-- config.color_scheme = "Rosé Pine (Gogh)"
-- config.color_scheme = "GruvboxDark"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "pwsh.exe", "-NoLogo" }
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	config.default_prog = { "/usr/bin/zsh" }
end

-- config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- this padding matches kitty terminal defaults(visually)
config.window_padding = {
	left = 0,
	right = 0,
	top = 5,
	bottom = 0,
}

config.audible_bell = "Disabled"
config.visual_bell = {
	fade_in_function = "EaseIn",
	fade_in_duration_ms = 100,
	fade_out_function = "EaseOut",
	fade_out_duration_ms = 100,
}
config.colors = {
	visual_bell = "#2d333f",
}

config.enable_kitty_keyboard = true

config.keys = {
	{
		key = "F11",
		mods = "CTRL|SHIFT",
		action = wezterm.action.ToggleFullScreen,
	},
}

return config
