-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.cmd("colorscheme base16-black-metal-gorgoroth")
vim.cmd("TransparentEnable")

if vim.g.neovide then
  vim.cmd("colorscheme base16-black-metal-gorgoroth")
  vim.g.neovide_refresh_rate = 144
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { fg = "none", bg = "none" })
  vim.g.guifont = "JetBrainsMono Nerd Font:h14"
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_title_text_color = "#ffffff"
  vim.g.transparency = 0.5
  vim.g.neovide_opacity = 0.0
end
