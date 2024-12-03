local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.font = wezterm.font 'JetBrainsMono Nerd Font'
config.font_size = 15

config.enable_tab_bar = true
config.window_decorations = "RESIZE"

config.window_background_opacity = 0.95

local osConfig = os.getenv("OS")
local modKey = ""

if osConfig == "Windows_NT" then
  modKey = "CTRL"
  config.default_prog = { 'sh', '-l' }
elseif osConfig == "MacOS" then
  modKey = "CMD"
end


config.keys = {
  { key = 'v', mods = modKey, action = wezterm.action.PasteFrom 'Clipboard' },
  { key = 'c', mods = modKey, action = wezterm.action.CopyTo 'ClipboardAndPrimarySelection' },
  { key = 'w', mods = modKey, action = wezterm.action.CloseCurrentTab { confirm = true } },
  { key = 't', mods = modKey, action = wezterm.action.SpawnCommandInNewTab {} },
}


return config

