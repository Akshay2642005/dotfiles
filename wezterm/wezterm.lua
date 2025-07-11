--- My Wezterm config file
local wez = require("wezterm")
local mappings = require("lua.mappings")
local appearance = require("lua.appeareance")
local c = {}
if wez.config_builder then
  c = wez.config_builder()
end
c.font = wez.font_with_fallback({
  family = "JetBrainsMono Nerd Font",
  stretch = "Expanded",
  weight = "Regular",
})
c.max_fps = 240
c.cell_width = 0.9
c.font_size = 12
c.default_prog = { "pwsh", "-NoLogo" }
-- c.default_prog = { "wsl" }
-- appearance
appearance.apply_to_config(c)
-- keys
mappings.apply_to_config(c)
--- statusbar
local bar = wez.plugin.require("https://github.com/adriankarlen/bar.wezterm")
local config = {
  position = "top",
  max_width = 16,
  padding = {
    left = 1,
    right = 1,
    tabs = {
      left = 0,
      right = 1,
    },
  },
  separator = {
    space = 0.5,
    left_icon = "",
    right_icon = "",
    field_icon = "",
  },
  modules = {
    tabs = {
      active_tab_fg = 4,
      inactive_tab_fg = 6,
      new_tab_fg = 2,
    },
    workspace = {
      enabled = false,
      color = 8,
    },
    -- leader = {
    --   enabled = false,
    -- },
    zoom = {
      enabled = false,
      icon = wez.nerdfonts.md_fullscreen,
      color = 4,
    },
    pane = {
      enabled = true,
      icon = wez.nerdfonts.cod_multiple_windows,
      color = 7,
    },
    username = {
      enabled = false,
    },
    hostname = {
      enabled = false,
    },
    clock = {
      enabled = false,
    },
    cwd = {
      enabled = true,
      icon = wez.nerdfonts.oct_file_directory,
      color = 7,
    },
    spotify = {
      enabled = false,
      icon = wez.nerdfonts.fa_spotify,
      color = 3,
      max_width = 64,
      throttle = 15,
    },
  },
}

-- bar.apply_to_config(c, config)

return c
