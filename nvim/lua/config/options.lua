-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--general settings
vim.cmd("set number")
vim.cmd("set ts=2")
vim.cmd("set cmdheight=0")
vim.cmd("set termguicolors")
vim.cmd("set shellcmdflag=-c")
vim.cmd("set shellquote=")
vim.cmd("set shellxquote=")
--vim.cmd([[hi NvimTreeNormal guibg=NONE ctermbg=NONE]])
vim.cmd("set background=dark")
--opts
vim.opt.autoindent = true
vim.opt.showcmd = true
vim.opt.smartindent = true
vim.opt.shell = "pwsh"
vim.opt.fillchars = { eob = " " }
vim.o.signcolumn = "yes"
vim.o.completeopt = "menuone,noselect,preview"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2



