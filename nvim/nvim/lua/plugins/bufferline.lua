return {
  "akinsho/bufferline.nvim",
  version = "*",
  lazy = true,
  dependencies = "nvim-tree/nvim-web-devicons",
  event = "VeryLazy",
  keys = {
    { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "Next tab" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev tab" },
  },
  opts = {
    options = {
      mode = "tabs",
    },
  },
}
