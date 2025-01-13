-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- set terminal default size
config.initial_cols = 160
config.initial_rows = 40

-- set renderer
-- config.front_end = "WebGpu"
-- config.front_end = "OpenGL"
-- config.mux_output_parser_coalesce_delay_ms = 3
for _, gpu in ipairs(wezterm.gui.enumerate_gpus()) do
	if gpu.backend == "Dx12" and gpu.device_type == "IntegratedGpu" then
		config.webgpu_preferred_adapter = gpu
		config.front_end = "WebGpu"
		break
	end
end
-- local gpus = wezterm.gui.enumerate_gpus()
-- config.webgpu_preferred_adapter = gpus[1]
-- config.front_end = "WebGpu"

-- config.color_scheme = "Catppuccin Mocha"
-- config.color_scheme = "Catppuccin Macchiato"
-- config.color_scheme = "tokyonight_night"
config.color_scheme = "tokyonight_storm"
-- config.color_scheme = "Kanagawa (Gogh)"
-- config.color_scheme = "Everforest Dark (Gogh)"
-- config.color_scheme = "Rosé Pine (Gogh)"
-- config.color_scheme = "GruvboxDark"

config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 14.0

if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	-- config.default_prog = { "pwsh.exe", "-NoLogo" }
	config.default_domain = "WSL:Ubuntu"
elseif wezterm.target_triple == "x86_64-unknown-linux-gnu" then
	config.default_prog = { "/usr/bin/zsh" }
end

-- config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 10,
	right = 10,
	top = 5,
	bottom = 5,
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

-- https://github.com/wez/wezterm/issues/3803#issuecomment-1608954312
config.hyperlink_rules = {
	-- Matches: a URL in parens: (URL)
	{
		regex = "\\((\\w+://\\S+)\\)",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in brackets: [URL]
	{
		regex = "\\[(\\w+://\\S+)\\]",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in curly braces: {URL}
	{
		regex = "\\{(\\w+://\\S+)\\}",
		format = "$1",
		highlight = 1,
	},
	-- Matches: a URL in angle brackets: <URL>
	{
		regex = "<(\\w+://\\S+)>",
		format = "$1",
		highlight = 1,
	},
	-- Then handle URLs not wrapped in brackets
	{
		-- Before
		--regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
		--format = '$0',
		-- After
		regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
		format = "$1",
		highlight = 1,
	},
	-- implicit mailto link
	{
		regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
		format = "mailto:$0",
	},
}

return config
