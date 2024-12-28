local M = {}
local wez = require "wezterm"
M.apply_to_config = function(c)
  c.color_scheme = "Cloud (terminal.sexy)"
  --c.color_scheme = 'kanagawabones'
  --c.color_scheme = "Rosé Pine Moon (Gogh)"
  c.default_cursor_style = "SteadyBar"
  c.inactive_pane_hsb = { brightness = 0.9 }
  c.window_decorations = "RESIZE"
  c.show_new_tab_button_in_tab_bar = false
  c.enable_tab_bar = false
  c.show_tabs_in_tab_bar = false
  c.use_fancy_tab_bar = false
  --c.window_background_opacity = 0.8
  c.colors = {
    background = 'rgb(0, 0, 0,65%)',
    cursor_border = "#bea3c7",
    cursor_bg = "#bea3c7",
    tab_bar = {
      background = 'rgb(0, 0, 0, 65%)', -- dark purple
    }
  }

  c.window_frame = {
    font = wez.font({ family = "IosevkaTerm Nerd Font", weight = "Bold" }),
    active_titlebar_bg = "#0e0e12",
  }
  c.window_padding = {
    left = '1cell',
    right = '1cell',
    top = '0.28cell',
    bottom = '0.08cell',
  }
end

return M
