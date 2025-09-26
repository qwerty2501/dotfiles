local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.use_ime = true
config.font = wezterm.font 'PlemolJP Console'
config.scrollback_lines = 65535
config.enable_scroll_bar = true
config.hide_tab_bar_if_only_one_tab=true

config.keys = {
  {
      key = "t",
      mods = "ALT",
      action = wezterm.action.SpawnTab "CurrentPaneDomain",
  },
  {
      key = ".",
      mods = "ALT",
      action = wezterm.action { SplitHorizontal = { domain = "CurrentPaneDomain" } },
  },
  {
      key = ",",
      mods = "ALT",
      action = wezterm.action { SplitVertical = { domain = "CurrentPaneDomain" } },
  },

}

return config
