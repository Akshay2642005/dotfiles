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
        ignoredCodes = { 80001 },
      },
    },
  },
  on_attach = function(client, bufnr)
    -- Fix potential position encoding issues
    client.offset_encoding = client.offset_encoding or "utf-16"
    client.commands["typescript.selectTypeScriptVersion"] = function() end
    -- Disable inlay hints by default
    if client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(false, { bufnr = bufnr })
    end
  end,
})




-- Disable inlay hints by default



vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(false, { bufnr = args.buf })
    end
  end,
})


vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client then
      client.offset_encoding = client.offset_encoding or "utf-16"
    end
    vim.lsp.set_log_level("ERROR")
  end,
})


if vim.opt.foldexpr:get() == "v:lua.LazyVim.ui.foldexpr()" then
  vim.opt.foldexpr = "v:lua.LazyVim.treesitter.foldexpr()"
end


-- search and replace function
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



-- srearch and replace function
function _G.Search_Replace()
  local search = vim.fn.input("Search: ")
  if search == "" then
    return
  end

  local replace = vim.fn.input("Replace: ")
  local flags = vim.fn.input("Flags (e.g., g, gc): ")

  -- Properly escape and format the command
  local cmd = string.format("%%s/%s/%s/%s",
    vim.fn.escape(search, "/"),
    vim.fn.escape(replace, "/"),
    flags
  )

  vim.cmd(cmd)
end

-- shada warning fix
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    pcall(vim.cmd.wshada)
  end,
})
