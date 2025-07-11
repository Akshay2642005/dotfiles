local M = {}
M.apply_to_config = function(c)
  c.color_scheme = "Black Metal (Gorgoroth) (base16)"
  c.window_decorations = "RESIZE"
  c.enable_tab_bar = false
  c.show_new_tab_button_in_tab_bar = false
  c.colors = {
    background = "rgb(0,0,0, 100%)",
    cursor_border = "#ffffff",
    cursor_bg = "#ffffff",
    -- tab_bar = {
    -- 	background = "rgb(0,0,0, 100%)",
    -- },
  }
end

return M
