local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 16

config.enable_tab_bar = true
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.95

return config
