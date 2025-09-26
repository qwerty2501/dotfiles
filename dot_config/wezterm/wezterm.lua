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

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.window_frame = {
  border_left_width='0cell',
  border_right_width='0cell',
  border_bottom_height='0cell',
  border_top_height='0cell',
}


return config
