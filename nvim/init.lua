-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.custom")

vim.cmd("colorscheme base16-black-metal-gorgoroth")
vim.cmd("TransparentEnable")

local install_info = require("nvim-treesitter.install")
install_info.compilers = { "zig" }

if vim.g.neovide then
  vim.cmd("colorscheme base16-black-metal-gorgoroth")
  vim.g.neovide_refresh_rate = 144
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { fg = "none", bg = "none" })
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_left = 5
  vim.g.neovide_padding_right = 5
  vim.g.neovide_title_text_color = "#ffffff"
  vim.g.neovide_italic_font = false
  vim.cmd("TransparentDisable")
end
