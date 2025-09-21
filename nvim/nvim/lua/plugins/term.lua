return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = false,
    enabled = false,
    -- enabled = false,
    config = function()
      require("toggleterm").setup({
        size = 3,
        open_mapping = [[<A-i>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        persist_size = true,
        direction = "float",
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "single",
        },
        winbar = {
          enabled = true,
          name_formatter = function(term)
            return term.name
          end,
        },
      })
    end,
  },
}
