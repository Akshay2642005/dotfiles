return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "helix",
    plugins = {
      marks = false,
      operators = false,
      windows = false,
      nav = false,
    },
    win = {
      padding = { 0, 1 },
      title = false,
      border = "single",
    },
    icons = {
      breadcrumb = ">>=",
      separator = ":: ",
      group = " ++ ",
      keys = {},
    },
  },
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
