return {
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "VeryLazy",
    keys = {
      { "<Tab>",   "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        highlights = {
          fill = {
            bg = "none",
            fg = "none",
          },
          background = {
            fg = "none",
            bg = "none",
          },
          tab = {
            bg = "none",
          },
          tab_selected = {
            bg = "none",
          },
          tab_close = {
            bg = "none",
          },
          close_button = {
            bg = "none",
          },
          close_button_selected = {
            bg = "none",
          },
          separator = {
            fg = "none",
            bg = "none",
          },
          separator_selected = {
            fg = "none",
            bg = "none",
          },
          separator_visible = {
            fg = "none",
            bg = "none",
          },
          buffer_visible = {
            bg = "none",
          },
          buffer_selected = {
            bg = "none",
          },
        },
        mode = "tabs",
        separator_style = "thin",
        show_buffer_close_icons = fasle,
        show_close_icon = false,
        hover = {
          enabled = true,
          delay = 200,
          reveal = { "close" },
        },
        always_show_bufferline = false,
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            text_align = "center",
            separator = true
          }
        },
        color_icons = true,
      }
    },
  },
}
