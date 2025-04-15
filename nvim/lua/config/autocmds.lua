vim.api.nvim_create_autocmd({ "Filetype" }, {
  pattern = "harpoon",
  callback = function()
    vim.opt.cursorline = true
    vim.api.nvim_set_hl(0, "HarpoonWindow", { link = "Normal" })
    vim.api.nvim_set_hl(0, "HarpoonBorder", { link = "Normal" })
  end,
})


-- Remove italics from specific highlight groups
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.cmd([[
      highlight Comment gui=NONE
      highlight Keyword gui=NONE
      highlight Function gui=NONE
      highlight Statement gui=NONE
      highlight Type gui=NONE
    ]])
  end,
})

