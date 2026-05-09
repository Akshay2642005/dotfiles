local M = {}
M.apply_to_config = function(c)
  -- c.color_scheme = "Black Metal (Gorgoroth) (base16)"
  c.color_scheme = "Black Metal (Gorgoroth) (base16)"
  c.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
  c.enable_tab_bar = true
  c.use_fancy_tab_bar = true
  c.window_background_opacity = 1
  c.colors = {
    background = "rgb(0,0,0, 100%)",
    cursor_border = "#ffffff",
    cursor_bg = "#ffffff",
    foreground = 'silver',
    selection_fg = 'black',
    split = '#444444',
    tab_bar = {
      active_tab = {
        bg_color = '#000000',
        fg_color = '#808080',
        intensity = 'Half',
        strikethrough = false,
      },
      inactive_tab = {
        bg_color = '#000000',
        fg_color = '#808080',
      },

      inactive_tab_hover = {
        bg_color = '#000000',
        fg_color = '#808080',
        italic = true,
      },

      new_tab = {
        bg_color = '#000000',
        fg_color = '#808080',
      },
      new_tab_hover = {
        bg_color = '#3b3052',
        fg_color = '#909090',
        italic = true,
      },
    },
  }
  c.window_frame = {
    active_titlebar_bg = 'rgb(0,0,0)',
    inactive_titlebar_bg = 'rgb(0,0,0)',
  }
end

return M
