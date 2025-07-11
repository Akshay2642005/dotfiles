return {
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
          "FloatBorder",
        },
      })
    end,
  },
  {
    "RRethy/base16-nvim",
  },
  {
    "webhooked/kanso.nvim",
    lazy = false,
    priority = 1000,
  },
}
