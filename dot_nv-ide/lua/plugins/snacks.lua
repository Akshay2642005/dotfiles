return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    animate = {},
    bigfile = {},
    bufdelete = {},
    debug = { enabled = false },
    dim = {},
    git = {},
    gitbrowse = {},
    indent = {},
    input = {},
    lazygit = {},
    notify = {},
    notifier = {
      timeout = 3000,
    },
    quickfile = {},
    rename = { enabled = false },
    scope = {},
    scroll = {},
    statuscolumn = {},
    terminal = {
      bo = {
        filetype = "snacks_terminal",
      },
      wo = {},
      keys = {
        q = "hide",
        gf = function(self)
          local f = vim.fn.findfile(vim.fn.expand("<cfile>"), "**")
          if f == "" then
            Snacks.notify.warn("No file under cursor")
          else
            self:hide()
            vim.schedule(function()
              vim.cmd("e " .. f)
            end)
          end
        end,
        term_normal = {
          "<esc>",
          function(self)
            self.esc_timer = self.esc_timer or (vim.uv or vim.loop).new_timer()
            if self.esc_timer:is_active() then
              self.esc_timer:stop()
              vim.cmd("stopinsert")
            else
              self.esc_timer:start(200, 0, function() end)
              return "<esc>"
            end
          end,
          mode = "t",
          expr = true,
          desc = "Double escape to normal mode",
        },
      },
    },
    toggle = {},
    win = {},
    words = {},
    zen = {},
    styles = {
      notification = {
        wo = { wrap = true } -- Wrap notifications
      }
    },
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "e", desc = "New file", action = ":ene | startinsert" },
          { icon = "ﭯ ", key = "o", desc = "Recently opened files", action = ":lua Snacks.dashboard,pick('oldfiles')" },
          { icon = " ", key = "f", desc = "Find file", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "r", desc = "Find word", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "g", desc = "Find modified file", action = ":lua Snacks.dashboard.pick('git_status')" },
          { icon = " ", key = "m", desc = "Show mark", action = ":lua Snacks.dashboard.pick('marks')" },
          {
            icon = " ",
            key = "c",
            desc = "Config",
            action = function()
              -- Change the working directory to the config path
              local config_path = vim.fn.stdpath('config')
              vim.cmd('cd ' .. config_path)
              -- Trigger the Snacks.dashboard.pick function
              --Snacks.dashboard.pick('files', { cwd = config_path })
              Snacks.picker.files({ cwd = config_path })
            end
          },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
    ███╗   ██╗██╗   ██╗      ██╗██████╗ ███████╗
    ████╗  ██║██║   ██║      ██║██╔══██╗██╔════╝
  ██╔██╗ ██║██║   ██║█████╗██║██║  ██║█████╗
  ██║╚██╗██║╚██╗ ██╔╝╚════╝██║██║  ██║██╔══╝
    ██║ ╚████║ ╚████╔╝       ██║██████╔╝███████╗
    ╚═╝  ╚═══╝  ╚═══╝        ╚═╝╚═════╝ ╚══════╝
    ]]
      },
      sections = {
        { section = "header" },
        {
          pane = 2,
          text = [[

 ▀ █ █ ▀   ▀ █ █ ▀   ▀ █ █ ▀   ▀ █ █ ▀   ▀ █ █ ▀   ▀ █ █ ▀
 ██   ██   ██   ██   ██   ██   ██   ██   ██   ██   ██   ██
 ▄ █ █ ▄   ▄ █ █ ▄   ▄ █ █ ▄   ▄ █ █ ▄   ▄ █ █ ▄   ▄ █ █ ▄

          ]],
          height = 5,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup", padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
        },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
      },
    },
  },
  keys = {
    { "<leader>un",   function() Snacks.notifier.hide() end,                                          desc = "Dismiss All Notifications" },
    { "<leader>bd",   function() Snacks.bufdelete() end,                                              desc = "Delete buffer" },
    { "<leader>bda",  function() Snacks.bufdelete.all() end,                                          desc = "Delete all buffer" },
    { "<leader>bdh",  function() Snacks.bufdelete.other() end,                                        desc = "Delete other buffer" },
    { "<leader>gg",   function() Snacks.lazygit() end,                                                desc = "Lazygit" },
    { "<leader>gb",   function() Snacks.git.blame_line() end,                                         desc = "Git Blame Line" },
    { "<leader>gB",   function() Snacks.gitbrowse() end,                                              desc = "Git Browse" },
    { "<leader>gf",   function() Snacks.lazygit.log_file() end,                                       desc = "Lazygit Current File History" },
    { "<leader>gl",   function() Snacks.lazygit.log() end,                                            desc = "Lazygit Log (cwd)" },
    { "<leader>x",    function() Snacks.terminal() end,                                               desc = "Toggle Terminal" },
    { "<leader>ld",   function() Snacks.terminal("lazydocker") end,                                   desc = "Toggle Terminal" },
    { "<leader>ob",   function() Snacks.terminal("overmind connect backend") end,                     desc = "Toggle Terminal" },
    { "<leader>gpr",  function() Snacks.terminal("gh pr list && echo 'Press enter...'; read") end,    desc = "PR list" },
    { "<leader>gprc", function() Snacks.terminal("gh pr create") end,                                 desc = "PR Create" },
    { "<leader>gprm", function() Snacks.terminal("gh pr ready ; gh pr merge") end,                    desc = "PR merge" },
    { "<leader>gi",   function() Snacks.terminal("gh issue list && echo 'Press enter...'; read") end, desc = "Issue list" },
    { "<leader>gio",  function() Snacks.terminal("gh issue create") end,                              desc = "Issue create" },
    { "<leader>gic", function()
      local issue_number = vim.fn.input('Issue Number -> ')
      Snacks.terminal("gh issue close " .. issue_number)
    end, },
    { "]]",         function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference" },
    { "[[",         function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference" },
    { "<leader>.",  function() Snacks.scratch.open() end,            desc = "Toggle Scratch Buffer" },
    { "<leader>S",  function() Snacks.scratch.select() end,          desc = "Select Scratch Buffer" },
    { "<F8>",       function() Snacks.zen() end,                     desc = "ZEN" },
    -- PICKER
    { "<C-n>",      function() Snacks.picker.colorschemes() end,     desc = "Colorscheme" },
    { "<leader>b",  function() Snacks.picker.buffers() end,          desc = "Buffers" },
    { "<leader>fg", function() Snacks.picker.grep() end,             desc = "Grep" },
    { "<leader>ff", function() Snacks.picker.files() end,            desc = "Find Files" },
    { "<leader>fp", function() Snacks.picker.git_files() end,        desc = "Find Git Files" },
    { "<leader>gs", function() Snacks.picker.git_status() end,       desc = "Git Status" },
    { "<leader>ll", function() Snacks.picker.lines() end,            desc = "Buffer Lines" },
    { "<leader>rb", function() Snacks.picker.grep_buffers() end,     desc = "Grep Open Buffers" },
    { "<leader>#",  function() Snacks.picker.grep_word() end,        desc = "Visual selection or word", mode = { "n", "x" } },
    { "<leader>y",  function() Snacks.picker.registers() end,        desc = "Registers" },
    { "<leader>sj", function() Snacks.picker.jumps() end,            desc = "Jumps" },
    { "<leader>m",  function() Snacks.picker.marks() end,            desc = "Marks" },
    { "<leader>p",  function() Snacks.picker.projects() end,         desc = "Projects" },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end,      desc = "LSP Symbols" },
    { "<leader>z",  function() Snacks.picker.zoxide() end,           desc = "Zoxide" },
    {
      "<leader>n",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Create some toggle mappings
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
      end,
    })
  end,
}
