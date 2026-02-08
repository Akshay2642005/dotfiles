local M = {}
M.apply_to_config = function(c)
  -- c.color_scheme = "Black Metal (Gorgoroth) (base16)"
  c.color_scheme = "Black Metal (Gorgoroth) (base16)"
  c.window_decorations = "RESIZE"
  c.enable_tab_bar = false
  c.window_background_opacity = 1
  c.colors = {
    background = "rgb(0,0,0, 100%)",
    cursor_border = "#ffffff",
    cursor_bg = "#ffffff",

  }
end

return M
