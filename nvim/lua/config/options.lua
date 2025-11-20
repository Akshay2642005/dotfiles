-- UI
vim.opt.number = true
vim.opt.relativenumber = false
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.cmdheight = 0
vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.ttyfast = true
vim.opt.shada = ""
vim.opt.shadafile = "NONE"


-- Editing
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.fileformat = "unix"
vim.opt.completeopt = { "menuone", "noselect", "preview" }

-- Visuals
vim.opt.fillchars = {
  eob = " ",
  horiz = '─',
  vert = '│',
  horizup = '┴',
  horizdown = '┬',
  verthoriz = '┼'
}
vim.cmd('hi VertSplit guifg=#888888 guibg=#222222')

vim.opt.guicursor =
"n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-CursorInsert,r-cr:hor20,o:hor50"

-- Shell
-- Use PowerShell as Neovim shell
vim.o.shell = "pwsh"
vim.o.shellcmdflag = "-NoLogo"
vim.o.shellquote = ""
vim.o.shellxquote = ""


-- Misc
vim.lsp.set_log_level("ERROR")
