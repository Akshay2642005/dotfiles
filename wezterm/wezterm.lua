--- My Wezterm config file


local wez = require "wezterm"
local utils = require "lua.utils"
local mappings = require "lua.mappings"
local appearance = require "lua.appeareance"
--local bar = wez.plugin.require "https://github.com/adriankarlen/bar.wezterm"


local c = {}


if wez.config_builder then
  c = wez.config_builder()
end


c.font = wez.font_with_fallback {
  family = 'IosevkaTerm Nerd Font',
  stretch = 'Expanded',
  weight = 'Regular',
}
c.cell_width = 0.9
c.font_size = 15
c.default_prog = utils.is_windows and {
  "C:\\Program Files\\PowerShell\\7\\pwsh.exe", "-NoLogo"
}
c.adjust_window_size_when_changing_font_size = false
c.audible_bell = "Disabled"
c.scrollback_lines = 1000
c.default_workspace = "main"
c.status_update_interval = 1000
--[[ c.window_background_opacity = 0.99 ]]




-- appearance
appearance.apply_to_config(c)


-- keys
mappings.apply_to_config(c)

-- bar
--bar.apply_to_config(c, { enabled_modules = { hostname = false } })

return c
