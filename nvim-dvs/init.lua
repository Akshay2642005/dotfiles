if vim.loader then
  vim.loader.enable()
end
_G.dd = function(...)
  require("util.debug").dump(...)
end
if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  -- Helper function for transparency formatting
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency =0.88 vim.g.neovide_background_color = "#0f1117"
  vim.g.neovide_window_blurred = true
  vim.g.neovide_refresh_rate = 144
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 0
  vim.g.neovide_theme = "vitesse"
  vim.o.guifont = "Hack Nerd Font:h14"
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animation_length = 0.0
  vim.g.neovide_cursor_trail_size = 0.0
  vim.g.neovide_text_gamma = 0
  vim.g.neovide_text_contrast = 0.1
end

if vim.g.neovide then
  vim.keymap.set("n", "<D-s>", ":w<CR>") -- Save
  vim.keymap.set("v", "<D-c>", '"+y') -- Copy
  vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
  vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
  vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
  vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })

vim.print = _G.dd
require("config.lazy")
