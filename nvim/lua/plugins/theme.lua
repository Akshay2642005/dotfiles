return {
  {
    "xiyaowong/transparent.nvim",
    config = function ()
      require("transparent").setup({
        extra_groups = {
          "NormalFloat",
          "FloatBorder"
        },
      })
    end
  },
  {
    'RRethy/base16-nvim',
  },
  {
    "ficcdaf/ashen.nvim",
    -- optional but recommended,
    -- pin to the latest stable release:
    tag = "*",
    lazy = false,
    priority = 1000,
    -- configuration is optional!
    opts = {
      -- your settings here
    },
  },
  {
    'lewis6991/impatient.nvim',
    condig = function()
      require('impatient').enable_profile()
    end,
  }
}
