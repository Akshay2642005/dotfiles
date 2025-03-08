local M = {}
M.apply_to_config = function(c)
	c.color_scheme = "Black Metal (Gorgoroth) (base16)"
	c.default_cursor_style = "SteadyBar"
	c.inactive_pane_hsb = { brightness = 0.9 }
	c.window_decorations = "RESIZE"
	c.show_new_tab_button_in_tab_bar = false
	c.enable_tab_bar = false
	c.show_tabs_in_tab_bar = false
	c.use_fancy_tab_bar = false
	c.colors = {
		background = "rgb(0,0,0, 68%)",
		cursor_border = "#ffffff",
		cursor_bg = "#ffffff",
		tab_bar = {
			background = "rgb(0,0,0, 68%)",
		},
	}
end

return M
