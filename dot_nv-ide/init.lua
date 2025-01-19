local utils = require("utils")
_G.keymap = vim.keymap.set
utils.fix_telescope_parens_win()
-- make help and man open up on the side instead above
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "man" },
  command = "wincmd L",
})
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)
-- vim opts
require("vimopts")

-- language specific mappings go here
require("mappings")
-- lazy.nvim setup
require("lazy").setup("plugins", {
  -- disable some rtp plugins
  disabled_plugins = {
    "gzip",
    -- "matchit",
    -- "matchparen",
    "netrwPlugin",
    "rplugin",
    "tarPlugin",
    "tohtml",
    "tutor",
    "zipPlugin",
  },
  default = {
    lazy = true,
  },
})

-- theme
vim.cmd("colorscheme kanagawa-paper")
--vim.g.colors_name == "kanagawa-paper"
if vim.g.colors_name == "gruvbox" or vim.g.colors_name == "kanagawa-paper" then
  --[[ utils.color_overrides.vague_line_colors() ]]
  utils.color_overrides.vague_status_colors()
elseif vim.g.colors_name == "base16-black-metal-gorgoroth" then
  vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#710000" })
  vim.api.nvim_set_hl(0, "TSComment", { fg = "#555555", gui = nil })

  vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#888888", bg = "#1e1e1e" })
  vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#888888", bg = "#1e1e1e" })
  vim.api.nvim_set_hl(0, "LineNr", { fg = "#d6d2c8" })
end

vim.api.nvim_create_user_command("VagueStatus", utils.color_overrides.vague_status_colors, {})
vim.api.nvim_create_user_command("VagueLine", utils.color_overrides.vague_line_colors, {})
vim.api.nvim_create_user_command("DefStatus", function()
  require("lualine").setup({ options = { theme = "auto" } })
end, {})


vim.api.nvim_create_autocmd("FileType", {
  desc = "python ft mappings",
  group = vim.api.nvim_create_augroup("py_mapping", { clear = true }),
  pattern = "python",
  callback = function()
    keymap("n", "<F11>", ":w <bar> exec '!python '.shellescape('%')<CR>")
  end
})


--runner
vim.api.nvim_create_autocmd("Filetype", {
  desc = "c ft mappings",
  group =
      vim.api.nvim_create_augroup("c_mapping", { clear = true }),
  pattern = "c",
  callback = function()
    keymap('n', '<F5>',
      ":w <bar> exec '!gcc '.shellescape('%').' -o '.shellescape('%:r').' && '.shellescape('%:r')<CR>")
    keymap('n', '<F6>', ":w <bar> exec ':terminal '.shellescape('%:r')<CR>")
  end
})

-- treesitter config
require 'nvim-treesitter.install'.compilers = { "clang" }
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = {
    "go",
    "rust",
    "c",
    "lua",
    "python",
    "html",
    "css",
    "javascript",
    "typescript",
    "templ",
    "prisma",
    "haskell",
    "zig",
    "latex",
    "gleam",
    "sql",
    "wgsl",
    "asm",
    "html",
    "css",
    "yaml",
    "java",
  },
  highlight = { enable = true },
  indent = { enable = true },
  auto_install = true,
  auto_sync = true
})

vim.filetype.add({ extension = { templ = "templ" } })

require 'lspconfig'.emmet_ls.setup {
  cmd = { "emmet-ls", "--stdio" }
}

require 'lspconfig'.html.setup {
  cmd = { "vscode-html-language-server", "--stdio" }
}



vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.cmd("TransparentEnable")
if vim.g.neovide then
  vim.cmd("colorscheme kanagawa-paper")
  vim.g.guifont = "JetBrainsMono Nerd Font:h14"
  --vim.g.guifont = "IosevkaTerm Nerd Font:h14"
  vim.g.neovide_padding_top = 10;
  vim.g.neovide_padding_bottom = 5;
  vim.g.neovide_padding_left = 5;
  vim.g.neovide_padding_right = 5;
  vim.g.neovide_text_gamma = 1;
  vim.g.neovide_text_contrast = 1;
  vim.g.neovide_transparency = 1;
  vim.g.neovide_title_text_color = "pink";
end
