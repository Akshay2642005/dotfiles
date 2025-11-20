local Snacks = require("snacks")

return {
  "folke/snacks.nvim",
  -- ensure plugin is loaded early if you rely on its behavior
  priority = 1000,
  lazy = false,
  opts = {
    -- 1) Notifications ok to keep
    notifier = { enabled = true },

    -- 2) Disable the image subsystem entirely (prevents WezTerm image hangs)
    --    Many users report picker hangs / freezes when image preview tries to use WezTerm.
    --    Setting enabled = false is the recommended defensive step.
    image = {
      enabled = false,
      -- if you used any image-specific sub-options previously, remove them
    },

    -- 3) Picker tuning: disable previews by default and keep explorer off
    picker = {
      notifier = { enabled = true },

      -- Global layout options: turn off preview by default (prevents heavy preview rendering)
      -- Many built-in pickers respect layout.preview = false when provided.
      layout = {
        preview = false, -- important: avoid live previews unless you need them
      },

      -- Win-level tweaks: minimize fancy input behavior and avoid expensive redraws
      win = {
        input = {
          -- keep your mappings small / avoid heavy inline formatting
          keys = {
            -- leave as-is or tune your keys
          },
        },
      },

      -- Per-source overrides (you already disabled explorer; keep it off)
      sources = {
        explorer = {
          enabled = false,
          layout = {
            preview = false,
            layout = {
              backdrop = false,
              width = 40,
              min_width = 40,
              height = 0,
              position = "right",
              border = "none",
              box = "vertical",
              { win = "list", border = "none" },
            },
          },
        },

        -- keep gh_* defaults or explicitly configure them if needed
        gh_issue = {},
        gh_pr = {},
      },

      -- Formatters: keep filename_first if you prefer it (your existing choice)
      formatters = {
        file = {
          filename_first = true,
        },
      },

      -- Optional: if you call pickers programmatically, pass `cwd` to limit scope:
      -- e.g. Snacks.picker.files({ cwd = vim.fn.getcwd(), ignore = { "node_modules" } })
      -- (See testing notes below.)
    },

    -- 4) Disable snacks scrolling/animation to reduce UI work
    --    (LazyVim / docs show `scroll.enabled = false` will quiet animations)
    scroll = { enabled = false },

    -- 5) keep other modules you want
    scope = {
      treesitter = {
        blocks = {
          "function_declaration",
          "function_definition",
          "method_declaration",
          "method_definition",
          "class_declaration",
          "class_definition",
          "do_statement",
          "while_statement",
          "repeat_statement",
          "if_statement",
          "for_statement",
          "try_statement",
          "with_statement",
        },
      },
    },

    indent = {
      enabled = true,
      animate = { enabled = false }, -- you already had this; keep it
    },

    -- image disabled above; leave the field present if other tooling expects it
    image = {
      enabled = false,
    },
  },

  -- keymaps unchanged; you can also add smaller-scope pickers that pass cwd
  keys = {
    { "<leader>gi", function() Snacks.picker.gh_issue() end,                  desc = "GitHub Issues (open)" },
    { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
    { "<leader>gp", function() Snacks.picker.gh_pr() end,                     desc = "GitHub Pull Requests (open)" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end,    desc = "GitHub Pull Requests (all)" },
    -- example: prefer a project-scoped files picker (fast)
    {
      "<leader>pf",
      function()
        -- use current git root or current working dir to keep the search small
        local cwd = vim.fn.getcwd()
        Snacks.picker.files({ cwd = cwd, ignore = { "node_modules", ".git" } })
      end,
      desc = "Project files (cwd-scoped)",
    },
  },
}
