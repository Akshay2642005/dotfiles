return {
  {
    'simrat39/rust-tools.nvim'
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = true,
    enabled = false,
    event = "VeryLazy",
    filetypes = { "dart" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup({
        ui = {
          border = "rounded",
          notification_style = "plugin",
        },
        decorations = {
          statusline = {
            app_version = true,
            device = true,
          },
          widget_guides = {
            enabled = true,
          },
        },
        lsp = {
          enabled = true,
          background = true,
          background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
          foreground = false,     -- highlight the foreground
          virtual_text = true,    -- show the highlight using virtual text
          virtual_text_str = "■",
        },
      })
    end,
  },
}
