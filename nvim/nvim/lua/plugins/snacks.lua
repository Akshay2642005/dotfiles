local Snacks = require("snacks")

return {

  "folke/snacks.nvim",
  opts = {
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
  },
}
