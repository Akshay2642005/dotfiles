--- My Wezterm config file

local wez = require("wezterm")
local mappings = require("lua.mappings")
local appearance = require("lua.appeareance")
local c = {}
if wez.config_builder then
	c = wez.config_builder()
end
c.front_end = "OpenGL"
c.animation_fps = 1
c.font = wez.font_with_fallback({
	--family = 'IosevkaTerm Nerd Font',
	family = "JetBrainsMono Nerd Font",
	stretch = "Expanded",
	weight = "Regular",
})
c.max_fps = 240
c.cell_width = 0.9
c.font_size = 14
c.default_prog = { "pwsh","-NoLogo" }
-- appearance
appearance.apply_to_config(c)
-- keys
mappings.apply_to_config(c)
return c
