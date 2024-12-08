local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 15

config.enable_tab_bar = true
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.95

local system = os.getenv("OS")
print(system)
local modKey = "CMD"

config.keys = {
  { key = 'w', mods = modKey, action = wezterm.action.CloseCurrentTab { confirm = true } },
  { key = 't', mods = modKey, action = wezterm.action.SpawnCommandInNewTab {} },
}


return config
