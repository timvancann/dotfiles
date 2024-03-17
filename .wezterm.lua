local wezterm = require 'wezterm'
local mux = wezterm.mux
local config = wezterm.config_builder()

config.color_scheme = 'Catppuccin Mocha'
config.enable_tab_bar = false
config.font_size = 14.0

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
end)

return config

