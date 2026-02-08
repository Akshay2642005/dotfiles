--- My Wezterm config file
local wez = require("wezterm")
local mappings = require("lua.mappings")
local appearance = require("lua.appeareance")
local tab = require("lua.tabline")

local c = {}
if wez.config_builder then
  c = wez.config_builder()
end
c.font = wez.font_with_fallback({
  family = "JetBrainsMono Nerd Font",
  stretch = "Expanded",
  weight = "Regular",
})
-- c.window_padding = {
--   left = 10,
--   right = 10,
--   top = 10,
--   bottom = 10,
-- }
c.use_resize_increments = true

-- c.font = wez.font_with_fallback({
--   "IosevkaTerm Nerd Font",
--   weight = "Regular",
-- })
c.max_fps = 240
c.cell_width = 0.9
c.font_size = 12
c.front_end = "OpenGL"
c.default_prog = { "pwsh" }
-- c.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe" }
-- c.default_prog = { "wsl" }
-- appearance
appearance.apply_to_config(c)
-- keys
mappings.apply_to_config(c)
-- tabline
tab.apply_to_config(c)

return c
