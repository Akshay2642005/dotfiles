local M = {
  "neovim/nvim-lspconfig",
  lazy = false,
  dependencies = {
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "saghen/blink.cmp" },
    { "SmiteshP/nvim-navic" },
  },
}

function M.on_attach(client, bufnr)
  local navic = require("nvim-navic")
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

function M.config()
  local lspconfig = require("lspconfig")
  local mason_lspconfig = require("mason-lspconfig")
  local capabilities = require('blink.cmp').get_lsp_capabilities(vim.lsp.protocol.make_client_capabilities())
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true
  }
  vim.diagnostic.config({
    virtual_text = false,
  })


  -- Diagnostics symbols for display in the sign column.
  local signs = { Error = " ", Warn = " ", Hint = "", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  require("mason").setup({
    ui = {
      border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗"
      }
    }
  })
  mason_lspconfig.setup {
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "gopls",
      "templ",
      "cssls",
      "tailwindcss",
      "ts_ls",
      "pylsp",
      "clangd",
      "prismals",
      "yamlls",
      "eslint",
      "zls",
      "marksman",
      "wgsl_analyzer",
    },
  }
  mason_lspconfig.setup_handlers {
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name) -- default handler (optional)
      lspconfig[server_name].setup {
        on_attach = M.on_attach,
        capabilities,
      }
    end,
    ["html"] = function()
      lspconfig.html.setup({
        on_attach = M.on_attach,
        capabilities,
        filetypes = { "html" }
      })
    end,
    ["rust_analyzer"] = function(server_name)
      lspconfig.rust_analyzer.setup({
        on_attach = M.on_attach,
        capabilities,
        settings = {
          ["rust-analyzer"] = {
            enable = "true",
            assist = {
              importGranularity = "module",
              importPrefix = "by_self",
            },
            cargo = {
              autoreload = true,
              buildScripts = {
                enable = true,
                overrideCommand = {
                  "build",
                  "--package",
                  "--bin",
                  "--example",
                  "--all-targets",
                },
              },
              noDefaultFeatures = true,
              targetDir = "./target",
            },
            diagnostics = {
              enable = true,
              disabled = {
                "unresolved-proc-macro",
                "macro-error",
                "unused-import",
                "unused-variable",
              },
              enableExperimental = true,
            },
            procMacro = {
              enable = true
            },
            checkOnSave = {
              command = "clippy"
            },
          }
        }
      })
    end,
    ["jsonls"] = function(server_name)
      lspconfig.jsonls.setup({
        on_attach = M.on_attach,
        capabilities,
        commands = {
          Format = {
            function()
              vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
            end
          }
        }
      })
    end,

    ["lua_ls"] = function(server_name)
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
    end,

    ["ts_ls"] = function(server_name)
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
    end,

    ["clangd"] = function(server_name)
      lspconfig.clangd.setup({
        cmd = {
          "clangd",
          "--background-index",
          "--pch-storage=memory",
          "--all-scopes-completion",
          "--pretty",
          "--header-insertion=never",
          "-j=4",
          "--inlay-hints",
          "--header-insertion-decorators",
          "--function-arg-placeholders",
          "--completion-style=detailed",
        },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = require("lspconfig").util.root_pattern("src"),
        init_option = { fallbackFlags = { "-std=c++2a" } },
        capabilities = capabilities,
      })
    end,
    ["emmet_ls"] = function(server_name)
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = {
          "templ",
          "html",
          "css",
          "javascriptreact",
          "typescriptreact",
          "javascript",
          "typescript",
          "jsx",
          "tsx",
          "markdown",
        },
      })
    end,
    ["tailwindcss"] = function(server_name)
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        filetypes = {
          "templ",
          "html",
          "css",
          "javascriptreact",
          "typescriptreact",
          "javascript",
          "typescript",
          "jsx",
          "tsx",
        },
        root_dir = require("lspconfig").util.root_pattern(
          "tailwind.config.js",
          "tailwind.config.cjs",
          "tailwind.config.mjs",
          "tailwind.config.ts",
          "postcss.config.js",
          "postcss.config.cjs",
          "postcss.config.mjs",
          "postcss.config.ts",
          "package.json",
          "node_modules",
          ".git"
        ),
      })
    end,
    ["templ"] = function(server_name)
      lspconfig.templ.setup({
        capabilities = capabilities,
        filetypes = { "templ" },
      })
    end,

    ["eslint"] = function(server_name)
      lspconfig.eslint.setup({
        capabilties = capabilities,
      })
    end,

    ["marksman"] = function(server_name)
      lspconfig.marksman.setup({
        capabilties = capabilities,
      })
    end,
  }
  -- require("ufo").setup()
end

return M
