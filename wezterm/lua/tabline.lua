local wez = require("wezterm")

local M = {}

-- Clean and extract last 2 segments of cwd, similar to before
local function clean_cwd(cwd_uri)
  if not cwd_uri then
    return ""
  end

  local path = cwd_uri.file_path or cwd_uri
  path = path:gsub("\\", "/")
  path = path:gsub("^/(%a:/)", "%1")
  path = path:gsub("^%a:/", "")
  path = path:gsub("^/*", "")
  path = path:gsub("/+$", "")

  local parts = {}
  for segment in string.gmatch(path, "[^/]+") do
    table.insert(parts, segment)
  end

  local count = #parts
  if count <= 2 then
    return table.concat(parts, "/")
  end
  return parts[count - 1] .. "/" .. parts[count]
end

-- Format a single tab title, with index + cwd + optional zoom indicator
wez.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local index = tostring(tab.tab_index + 1)

  local cwd = clean_cwd(tab.active_pane.current_working_dir)
  if cwd == "" then
    cwd = tab.active_pane.title or ""
  end

  local zoomed = tab.active_pane.is_zoomed and "" or "" -- or any symbol you like

  -- Build the Title: e.g. "1: projects/nodebase ■"
  local title = index .. ": " .. cwd
  if zoomed ~= "" then
    title = title .. " " .. zoomed
  end

  -- Return formatted title
  return {
    { Text = " " .. title .. " " }
  }
end)

M.apply_to_config = function(c)
  -- Recommended minimal tab-bar style
  --c.enable_tab_bar = false
  c.use_fancy_tab_bar = false
  c.show_new_tab_button_in_tab_bar = false

  -- Keep some padding and max width
  c.tab_max_width = 50

  -- Colors for tab bar (adjust to your theme)
  c.colors = c.colors or {}
  c.colors.tab_bar = {
    background = "rgb(0,0,0, 95%)",
    active_tab = {
      -- bg_color = "#000000",
      bg_color = "rgb(0,0,0, 95%)",
      fg_color = "#bbbbbb",
      intensity = "Normal",
      underline = "None",
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      -- bg_color = "#000000",
      bg_color = "rgb(0,0,0, 95%)",
      fg_color = "#444444",
    },
    inactive_tab_hover = {
      -- bg_color = "#111111",
      bg_color = "rgb(0,0,0, 95%)",
      fg_color = "#888888",
    },
    new_tab = {
      -- bg_color = "#000001",
      bg_color = "rgb(0,0,0, 95%)",
      fg_color = "#555555",
    },
    new_tab_hover = {
      -- bg_color = "#222222",
      bg_color = "rgb(0,0,0, 95%)",
      fg_color = "#888888",
    },
  }

  -- Optional: tab bar at bottom
  c.tab_bar_at_bottom = false
end

return M
