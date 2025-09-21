vim.cmd("set number")
vim.cmd("set ts=2")
vim.cmd("set cmdheight=0")
vim.cmd("set termguicolors")
vim.cmd("set shell=pwsh")
vim.cmd("set shellcmdflag=-c")
vim.cmd("set shellquote=")
vim.cmd("set shellxquote=")
vim.cmd("set background=dark")
vim.cmd("set norelativenumber")
vim.cmd("set scrolloff=5")
vim.opt.autoindent = true
vim.opt.showcmd = true
vim.opt.smartindent = true
vim.opt.fillchars =
  { vert = " ", horiz = " ", horizup = " ", horizdown = " ", vertleft = " ", vertright = " ", verthoriz = " " }
vim.opt.fillchars = { eob = " " }
vim.opt.guicursor = "n-v-c:block-blinkon1-CursorInsert,i:block-CursorInsert"
vim.o.signcolumn = "yes"
vim.o.completeopt = "menuone,noselect,preview"
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2
