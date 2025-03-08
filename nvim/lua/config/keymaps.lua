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
vim.keymap.set("n", "<A-d>", vim.diagnostic.open_float, { desc = "Diagnostics" })
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
vim.keymap.set("n", "<C-n>", ":Telescope colorscheme<CR>")
vim.keymap.set("n", "<C-w><down>", "<C-w>-")
vim.keymap.set("n", "[e", vim.diagnostic.goto_next)
vim.keymap.set("n", "]e", vim.diagnostic.goto_next)
vim.keymap.set("n", "<C-w>f", "<CMD>Telescope flutter commands<CR>", { desc = "flutter commands" })
vim.keymap.set("n", "<A-i>", "<CMD>ToggleTerm<CR>")
vim.keymap.set("n","<leader>e",'<CMD>lua require("oil").toggle_float()<CR>')
vim.keymap.set(
  "n",
  "<F4>",
  "<CMD>Telescope toggletasks edit<CR>",
  { noremap = true, silent = true, nowait = true, desc = "Task edit" }
)
vim.keymap.set(
  "n",
  "<F3>",
  "<CMD>Telescope toggletasks spawn<CR>",
  { noremap = true, silent = true, nowait = true, desc = "Task Spwan" }
)
vim.keymap.set(
  "n",
  "<F2>",
  "<CMD>Telescope toggletasks select<CR>",
  { noremap = true, silent = true, nowait = true, desc = "Make Select" }
)
vim.diagnostic.config({
  virtual_text = false,
})

function Leave_snippet()
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
    autocmd ModeChanged * lua Leave_snippet()
]])

--search and replace
vim.keymap.set("n", "<leader>sr", function()
  -- Prompt the user for the search pattern
  local search = vim.fn.input("Search: ")
  if search == "" then
    return
  end -- Exit if no input

  -- Prompt the user for the replace pattern
  local replace = vim.fn.input("Replace: ")

  -- Prompt the user for flags (e.g., 'g', 'gc', etc.)
  local flags = vim.fn.input("Flags (e.g., g, gc): ")

  -- Perform the substitution
  vim.cmd(string.format("%%s/%s/%s/%s", vim.fn.escape(search, "/"), vim.fn.escape(replace, "/"), flags))
end, { desc = "Dynamic search and replace" })

vim.api.nvim_create_autocmd({ "Filetype" }, {
  pattern = "harpoon",
  callback = function()
    vim.opt.cursorline = true
    vim.api.nvim_set_hl(0, "HarpoonWindow", { link = "Normal" })
    vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "Normal" })
  end,
})
