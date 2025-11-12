local Snacks = require("snacks")

return {

  "folke/snacks.nvim",
  opts = {
    gh = {
      -- your gh configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    picker = {
      sources = {
        explorer = {
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
              -- { win = "preview", title = "{preview}", height = 0.4, border = "top" },
            },
          },
        },
        gh_issue = {
          -- your gh_issue picker configuration comes here
          -- or leave it empty to use the default settings
        },
        gh_pr = {
          -- your gh_pr picker configuration comes here
          -- or leave it empty to use the default settings
        }
      },
      formatters = {
        file = {
          filename_first = true,
        },
      },
    },
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
      animate = {
        enabled = false,
      },
    },
    image = {
    }
  },
  keys = {
    { "<leader>gi", function() Snacks.picker.gh_issue() end,                  desc = "GitHub Issues (open)" },
    { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
    { "<leader>gp", function() Snacks.picker.gh_pr() end,                     desc = "GitHub Pull Requests (open)" },
    { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end,    desc = "GitHub Pull Requests (all)" },
  },
}
