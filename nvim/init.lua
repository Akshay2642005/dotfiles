require("config.lazy")
require("config.custom")
vim.api.nvim_set_hl(0, "SnacksTerminalTitle", { fg = "NONE", bg = "NONE" })
vim.cmd("colorscheme base16-black-metal-gorgoroth")
vim.cmd("TransparentEnable")
if vim.g.neovide then
  -- vim.cmd("TransparentDisable")
  vim.cmd("colorscheme base16-black-metal-gorgoroth")
  vim.g.neovide_title_background_color = "#000000"
  vim.g.neovide_title_text_color = "#000000"
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_refresh_rate = 144
end

--lsp Rust
