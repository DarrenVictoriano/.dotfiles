-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

config.default_prog = {
	"/bin/zsh",
	"--login",
	"-c",
	[[
	   if command -v tmux >/dev/null 2>&1; then
	     tmux attach || tmux new;
	   else
	     exec zsh;
	   fi
	   ]],
}

-- This requires installation: https://wezfurlong.org/wezterm/config/lua/config/term.html
config.term = "wezterm"

-- This is where you actually apply your config choices
config.color_scheme = "catppuccin-macchiato"

config.font = wezterm.font("MesloLGS Nerd Font Mono")
config.font_size = 14

config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_close_confirmation = "NeverPrompt"

config.cursor_blink_ease_out = "Constant"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_rate = 400

config.window_padding = {
	left = 2,
	right = 2,
	top = 25,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
