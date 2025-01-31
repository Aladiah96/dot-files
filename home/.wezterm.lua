-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your configchoices
-- config.window_background_image = 'path/to/wallpaper.jpg'
config.window_background_opacity = 1
config.hide_tab_bar_if_only_one_tab = true

-- config.color_scheme = 'Gruvbox dark, medium (base16)'
config.font = wezterm.font 'Geist Mono'

return config
