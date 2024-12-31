-- general settings
vim.cmd("set number")
--vim.cmd("set relativenumber")
vim.cmd("set ts=2")
vim.cmd("set cmdheight=0")
vim.cmd("set termguicolors")


vim.opt.autoindent = true
vim.opt.showcmd = true
vim.opt.smartindent = true
vim.opt.shell = "pwsh -NoLogo"
vim.opt.fillchars = { eob = " " }

local utils = require("utils")
local os_name = utils.get_os()
if os_name == "windows" then
  vim.cmd("set shell=pwsh")
else
  --vim.cmd("set shell=/bin/zsh")
end
vim.cmd("set shellcmdflag=-c")
vim.cmd("set shellquote=")
vim.cmd("set shellxquote=")

-- stop right-shift when errors/warning appear
vim.o.signcolumn = "yes"
vim.o.completeopt = "menuone,noselect,preview"

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

-- move selections
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Shift visual selected line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Shift visual selected line up

-- colorscheme picker
vim.keymap.set("n", "<C-n>", ":Telescope colorscheme<CR>")


--python run
--Code Runner
--vim.keymap.set("n", '<F4>', ":'!python3'.shellscape('%')<CR>")

-- remaps
vim.g.mapleader = " "

-- zig
-- vim.g.zig_fmt_autosave = 0



--Code Runner

vim.keymap.set('n', '<leader>rr', '<CMD>RunCode<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rf', '<CMD>RunFile<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rt', '<CMD>RunFile tab<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rp', '<CMD>RunProject<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rc', '<CMD>RunClose<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rcf', '<CMD>CRFiletype<CR>', { noremap = true, silent = false })
vim.keymap.set('n', '<leader>rcp', ':CRProjects<CR>', { noremap = true, silent = false })


-- Telescope setup
--[[ vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>")

vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>")
 ]] --

vim.keymap.set("n", "<leader>fb", "<CMD>Telescope file_browser<CR>", { desc = "file_browser" })
--toggle term
vim.keymap.set("n", "<leader>tt", "<CMD>ToggleTerm<CR>", { noremap = true, silent = false })

-- nvim-tree setup
vim.keymap.set("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", { desc = "NvimTree" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "Y", "yy")

-- lsp setup
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })


-- see error
vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, { desc = "Diagnostics" })
-- New tab
vim.keymap.set("n", "te", "<CMD>tabedit<Return>")
vim.keymap.set("n", "<tab>", "<CMD>tabnext<Return>")
vim.keymap.set("n", "<s-tab>", "<CMD>tabprev<Return>")
-- Move window
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")

-- Resize window
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")

-- go to errors
vim.keymap.set("n", "[e", vim.diagnostic.goto_next)
vim.keymap.set("n", "]e", vim.diagnostic.goto_next)

-- disable default errors
vim.diagnostic.config({
  virtual_text = false,
})

function leave_snippet()
  if
      ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
      and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
  then
    require("luasnip").unlink_current()
  end
end

-- stop snippets when you leave to normal mode
vim.api.nvim_command([[
    autocmd ModeChanged * lua leave_snippet()
]])
