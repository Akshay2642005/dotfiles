---wezterm.lua
---$ figlet -f small Wezterm
--- __      __      _
--- \ \    / /__ __| |_ ___ _ _ _ __
---  \ \/\/ / -_)_ /  _/ -_) '_| '  \
---  \_/\_/\___/__|\__\___|_| |_|_|_|

--- My Wezterm config file
local wezterm = require("wezterm")
----require("launch")
----require("events")
local act = wezterm.action
--local mux = wezterm.mux
local config = {}
-- Use config builder object if possible
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Settings
config.term = "xterm-256color"
config.default_cwd = "~/Akshay"
config.default_prog = {
  "Arch.exe"
  --"wsl.exe",
  --"C:/Program Files/Git/bin/bash.exe -i -l",
}
config.color_scheme = "Adventure"
config.font = wezterm.font_with_fallback({
  { family = "Hack Nerd Font", scale = 1.2, weight = "Medium" },
  { family = "Hack Nerd Font", scale = 1.3 },
})
config.window_background_opacity = 0.93
config.text_background_opacity = 0.93
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "main"
config.default_cursor_style = "SteadyBar"
---config.animation_fps = 120
---config.cursor_blink_ease_in = 'Constant'
---config.cursor_blink_ease_out = 'Constant'
-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.24,
  brightness = 0.5,
}

-- Keys
config.leader = { key = "a", mods = "ALT", timeout_milliseconds = 1000 }
config.keys = {
  -- Send C-a when pressing C-a twice
  { key = "a",          mods = "LEADER|ALT", action = act.SendKey({ key = "a", mods = "CTRL" }) },
  { key = "c",          mods = "LEADER",     action = act.ActivateCopyMode },
  { key = "phys:Space", mods = "LEADER",     action = act.ActivateCommandPalette },

  -- Pane keybindings
  { key = "s",          mods = "LEADER",     action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "v",          mods = "LEADER",     action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "h",          mods = "LEADER",     action = act.ActivatePaneDirection("Left") },
  { key = "j",          mods = "LEADER",     action = act.ActivatePaneDirection("Down") },
  { key = "k",          mods = "LEADER",     action = act.ActivatePaneDirection("Up") },
  { key = "l",          mods = "LEADER",     action = act.ActivatePaneDirection("Right") },
  { key = "q",          mods = "LEADER",     action = act.CloseCurrentPane({ confirm = true }) },
  { key = "z",          mods = "LEADER",     action = act.TogglePaneZoomState },
  { key = "o",          mods = "LEADER",     action = act.RotatePanes("Clockwise") },
  -- We can make separate keybindings for resizing panes
  -- But Wezterm offers custom "mode" in the name of "KeyTable"
  {
    key = "r",
    mods = "LEADER",
    action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }),
  },

  -- Tab keybindings
  { key = "t", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },
  { key = "[", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "]", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "n", mods = "LEADER", action = act.ShowTabNavigator },
  {
    key = "e",
    mods = "LEADER",
    action = act.PromptInputLine({
      description = wezterm.format({
        { Attribute = { Intensity = "Bold" } },
        { Foreground = { AnsiColor = "Fuchsia" } },
        { Text = "Renaming Tab Title...:" },
      }),
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },
  -- Key table for moving tabs around
  { key = "m", mods = "LEADER",       action = act.ActivateKeyTable({ name = "move_tab", one_shot = false }) },
  -- Or shortcuts to move tab w/o move_tab table. SHIFT is for when caps lock is on
  { key = "{", mods = "LEADER|SHIFT", action = act.MoveTabRelative(-1) },
  { key = "}", mods = "LEADER|SHIFT", action = act.MoveTabRelative(1) },

  -- Lastly, workspace
  { key = "w", mods = "LEADER",       action = act.ShowLauncherArgs({ flags = "FUZZY|WORKSPACES" }) },
}
-- I can use the tab navigator (LDR t), but I also want to quickly navigate tabs with index
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = "LEADER",
    action = act.ActivateTab(i - 1),
  })
end

config.key_tables = {
  resize_pane = {
    { key = "h",      action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "j",      action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = "k",      action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "l",      action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  },
  move_tab = {
    { key = "h",      action = act.MoveTabRelative(-1) },
    { key = "j",      action = act.MoveTabRelative(-1) },
    { key = "k",      action = act.MoveTabRelative(1) },
    { key = "l",      action = act.MoveTabRelative(1) },
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter",  action = "PopKeyTable" },
  },
}

-- Tab bar
-- I don't like the look of "fancy" tab bar
config.term = "xterm-256color"
--config.win32_system_backdrop = "Acrylic"
config.show_new_tab_button_in_tab_bar = false
--config.tab_bar_at_bottom = true
config.show_tabs_in_tab_bar = false
--config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.status_update_interval = 1000
--[[wezterm.on("update-status", function(window, pane)
  -- Workspace name
  local stat = window:active_workspace()
  local stat_color = "#f7768e"
  -- It's a little silly to have workspace name all the time
  -- Utilize this to display LDR or current key table name
  if window:active_key_table() then
    stat = window:active_key_table()
    stat_color = "#7dcfff"
  end
  if window:leader_is_active() then
    stat = "LDR"
    stat_color = "#7dcfff"
  end

  local basename = function(s)
    -- Nothing a little regex can't fix
    return string.gsub(s, "(.*[/\\])(.*)", "%2")
  end

  -- Current working directory
  local cwd = pane:get_current_working_dir()
  if cwd then
    if type(cwd) == "userdata" then
      -- Wezterm introduced the URL object in 20240127-113634-bbcac864
      cwd = basename(cwd.file_path)
    else
      -- 20230712-072601-f4abf8fd or earlier version
      cwd = basename(cwd)
    end
  else
    cwd = ""
  end

  -- Current command
  local cmd = pane:get_foreground_process_name()
  -- CWD and CMD could be nil (e.g. viewing log using Ctrl-Alt-l)
  cmd = cmd and basename(cmd) or ""

  -- Time
  -- local time = wezterm.strftime("%H:%M")

  -- Left status (left of the tab line)
  window:set_left_status(wezterm.format({
    { Background = { Color = "#040404" } },
    { Foreground = { Color = stat_color } },
    { Text = " " },
    { Background = { Color = "#040404" } },
    { Text = wezterm.nerdfonts.oct_table .. "  " .. stat },
    { Background = { Color = "#040404" } },
    { Text = " |" },
    { Background = { Color = "#040404" } },
  }))

  -- Right status
  window:set_right_status(wezterm.format({
    --Wezterm has a built-in nerd fonts
    --https://wezfurlong.org/wezterm/config/lua/wezterm/nerdfonts.html
    { Background = { Color = "#040404" } },
    { Text = wezterm.nerdfonts.md_folder .. "  " .. cwd },
    { Text = " " },
    { Background = { Color = "#040404" } },
    { Foreground = { Color = "#e0af68" } },
    { Text = wezterm.nerdfonts.fa_code .. "  " .. cmd },
    "ResetAttributes",
    { Background = { Color = "#040404" } },
    { Text = "" },
    --{ Text = " |           " },
    --{ Text = wezterm.nerdfonts.md_clock .. "  " .. time },
    { Text = " " },
  }))
end)--]]

-- Appearance setting for when I need to take pretty screenshots
--config.enable_tab_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}
config.colors = {
  tab_bar = {
    -- The color of the strip that goes along the top of the window
    -- (does not apply when fancy tab bar is in use)
    background = "#040404",

    -- The active tab is the one that has focus in the window
    active_tab = {
      -- The color of the background area for the tab
      bg_color = "#040404",
      -- The color of the text for the tab
      fg_color = "#ffffff",

      -- Specify whether you want "Half", "Normal" or "Bold" intensity for the
      -- label shown for this tab.
      -- The default is "Normal"
      intensity = "Normal",

      -- Specify whether you want "None", "Single" or "Double" underline for
      -- label shown for this tab.
      -- The default is "None"
      underline = "None",

      -- Specify whether you want the text to be italic (true) or not (false)
      -- for this tab.  The default is false.
      italic = false,

      -- Specify whether you want the text to be rendered with strikethrough (true)
      -- or not for this tab.  The default is false.
      strikethrough = false,
    },

    -- Inactive tabs are the tabs that do not have focus
    inactive_tab = {
      bg_color = "#040404",
      fg_color = "#808080",

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over inactive tabs
    inactive_tab_hover = {
      bg_color = "#040404",
      fg_color = "#909090",
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `inactive_tab_hover`.
    },

    -- The new tab button that let you create new tabs
    new_tab = {
      bg_color = "#040404",
      fg_color = "#808080",

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab`.
    },

    -- You can configure some alternate styling when the mouse pointer
    -- moves over the new tab button
    new_tab_hover = {
      bg_color = "#040404",
      fg_color = "#909090",
      italic = true,

      -- The same options that were listed under the `active_tab` section above
      -- can also be used for `new_tab_hover`.
    },
  },
}
--[[config.window_frame = {
  inactive_titlebar_bg = '#353535',
  active_titlebar_bg = '#040404',
  inactive_titlebar_fg = '#cccccc',
  active_titlebar_fg = '#ffffff',
  inactive_titlebar_border_bottom = '#040404',
  active_titlebar_border_bottom = '#040404',
  button_fg = '#040404',
  button_bg = '#040404',
  button_hover_fg = '#ffffff',
  button_hover_bg = '#040404',
}--]]
return config
