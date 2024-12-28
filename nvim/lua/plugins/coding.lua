return {
  {
    "windwp/nvim-ts-autotag",
    opts = {},
    ft = {
      "html",
      "svelte",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "markdown",
      "xml",
    },
  },
  {
    "smjonas/inc-rename.nvim",
    cmd = "IncRename",
    opts = {},
    keys = {
      {
        "<leader>cr",
        function()
          return ":IncRename " .. vim.fn.expand "<cword>"
        end,
        expr = true,
        desc = "Rename",
        icon = "",
      },
    },
  },
  { "folke/ts-comments.nvim", event = "BufReadPre", opts = {} },
}
