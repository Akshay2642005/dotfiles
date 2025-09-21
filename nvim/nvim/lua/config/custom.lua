--Local Mason Bin PATH
local mason_bin = vim.fn.stdpath("data") .. "\\mason\\bin\\"

local fmt_paths = {
  stylua = mason_bin .. "stylua.CMD",
  shfmt = mason_bin .. "shfmt.CMD",
  gofumpt = mason_bin .. "gofumpt.CMD",
  goimports = mason_bin .. "goimports.CMD",
  ["php-cs-fixer"] = mason_bin .. "php-cs-fixer.CMD",
  ["clang-format"] = mason_bin .. "clang-format.CMD",
  prettier = mason_bin .. "prettier.CMD",
  ktlint = mason_bin .. "ktlint.CMD",
  ruff = mason_bin .. "ruff.CMD",
  buf = mason_bin .. "buf.CMD",
  ["ast-grep"] = mason_bin .. "ast-grep.CMD",
  asmfmt = mason_bin .. "asmfmt.CMD",
  rubocop = mason_bin .. "rubocop.CMD",
}

local formatter_config = {}
for name, path in pairs(fmt_paths) do
  formatter_config[name] = {
    command = string.format('"%s"', path),
  }
end

require("conform").setup({
  formatters = formatter_config,
})


--lsp

local lspconfig = require("lspconfig")
lspconfig.vtsls.setup({
  settings = {
    vtsls = {
      diagnostics = {
        ignoredCodes = { 80001 }, -- Replace with actual warning code
      },
    },
  },
})
