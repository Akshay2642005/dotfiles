-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.custom")
vim.cmd("colorscheme base16-black-metal-gorgoroth")
if vim.g.neovide then
  vim.cmd("colorscheme base16-black-metal-gorgoroth")
  vim.g.neovide_refresh_rate = 144
end

--lsp Rust
