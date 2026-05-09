---@diagnostic disable: unused-local
--- My Wezterm config file
local wez = require("wezterm")
local mappings = require("lua.mappings")
local appearance = require("lua.appeareance")
local menu = require("lua.menu")
local c = {}
if wez.config_builder then
  c = wez.config_builder()
end
--
-- c.font = wez.font_with_fallback({
--   "GeistMono Nerd Font",
--   weight = "Regular",
-- })
c.font = wez.font("GeistMono Nerd Font")

c.window_padding = {
  left = "5px",
  right = "5px",
  top = "0px",
  bottom = "1px",
}

c.use_resize_increments = true
c.max_fps = 240
c.cell_width = 0.9
c.line_height = 1.0
c.font_size = 13
c.line_height = 1
c.front_end = "OpenGL"
c.term = "xterm-256"
c.default_prog = { 'pwsh.exe', '-NoLogo' }

-- tab name change
wez.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local cwd = tab.active_pane.current_working_dir
  if cwd then
    -- Show only the last directory component
    local path = cwd.file_path
    local home = wez.home_dir
    path = path:gsub(home, '~')             -- replace home with ~
    path = path:match('([^/]+)/*$') or path -- grab last segment
    return path
  end
  return tab.active_pane.title
end)

-- appearance
appearance.apply_to_config(c)
-- keys
mappings.apply_to_config(c)

menu.apply_to_config(c)

return c
