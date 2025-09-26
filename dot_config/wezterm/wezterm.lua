local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.use_ime = true
config.font = wezterm.font 'PlemolJP Console'
config.scrollback_lines = 65535
config.enable_scroll_bar = true


return config
