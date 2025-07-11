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

local function augroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  group = augroup("jenkinsfile_detect"),
  pattern = { "Jenkinsfile" },
  callback = function()
    vim.cmd("set filetype=groovy")
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Comment", {
      bold = false,
      ctermfg = "DarkGrey",
      ctermbg = "NONE",
    })
  end,
})
