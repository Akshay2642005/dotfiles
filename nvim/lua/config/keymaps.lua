-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
--
vim.g.mapleader = " "
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Shift visual selected line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Shift visual selected line up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-f>", "<C-f>zz")
vim.keymap.set("n", "<C-b>", "<C-b>zz")
vim.keymap.set("n", "Y", "yy")
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
vim.keymap.set("n", "te", "<CMD>tabedit<Return>")
vim.keymap.set("n", "<tab>", "<CMD>tabnext<Return>")
vim.keymap.set("n", "<s-tab>", "<CMD>tabprev<Return>")
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sl", "<C-w>l")
vim.keymap.set("n", "<C-w><left>", "<C-w><")
vim.keymap.set("n", "<C-w><right>", "<C-w>>")
vim.keymap.set("n", "<C-w><up>", "<C-w>+")
vim.keymap.set("n", "<C-n>", "<CMD>Telescope colorscheme<CR>")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")
vim.keymap.set("n", "[e", vim.diagnostic.goto_next)
vim.keymap.set("n", "]e", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>e", '<CMD>lua require("oil").toggle_float()<CR>')
vim.keymap.set("n", "<leader>mh", '<CMD>MCPHub<CR>', { desc = "Toggle McpHub" })
vim.keymap.set("n", "<C-w>l", '<CMD>lua Snacks.picker.lines()<CR>')
vim.keymap.set({ "n", "v" }, "<A-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
-- Terminal Mappings
vim.keymap.set(
  "n",
  "<F5>",
  "<CMD>TodoTelescope<CR>",
  { noremap = true, silent = true, nowait = true, desc = "TodoList" }
)

-- Show all diagnostics in a floating list (like :lua vim.diagnostic.setqflist())
vim.diagnostic.config({
  virtual_text = false,
})
vim.keymap.set("n", "<C-w>D", function()
  vim.diagnostic.setqflist()
end, { desc = "Show All Diagnostics (Quickfix List)" })

vim.keymap.set("n", "<C-w>t", "<CMD>TodoQuickFix<CR>", { desc = "Todo List (Quickfix)" })

-- OR use Trouble if you have it installed
-- vim.keymap.set("n", "<leader>ld", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Show All Diagnostics" })


--search and replace
vim.keymap.set("n", "<leader>sr", Search_Replace, { desc = "Dynamic search and replace" })

-- pane mappings
vim.keymap.set("n", "<C-w><Up>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-w><Down>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-w><Left>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-w><Right>", "<C-w>l", { desc = "Move to right window" })


-- Telescope project
vim.api.nvim_set_keymap(
  'n',
  '<C-p>',
  ":lua require'telescope'.extensions.projects.projects{}<CR>",
  { noremap = true, silent = true }
)
