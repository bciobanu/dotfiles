local wezterm = require'wezterm'

local config = wezterm.config_builder()

config.color_scheme = 'Navy and Ivory (terminal.sexy)'
config.harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' }
config.font_size = 9.0
config.scrollback_lines = 1000000

config.keys = {
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = false },
  },
  {
    key = '0',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.PaneSelect,
  },
  {
    key = '1',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.ShowTabNavigator,
  },
}

config.ssh_domains = {
  {
    name = 'work',
    username = 'bciobanu',
    remote_wezterm_path = '/home/bciobanu/bin/wezterm',
  }
}

return config