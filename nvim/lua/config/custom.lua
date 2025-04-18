--lsp
require("lspconfig").vtsls.setup({
  settings = {
    vtsls = {
      diagnostics = {
        ignoredCodes = { 80001 } -- Replace with actual warning code
      }
    }
  }
})

require("lspconfig").zls.setup({
  settings = {
    zls = {
      cmd = { "zls" },
      checkOnSave = {
        enable = false
      }
    }
  }
})

vim.g.rustaceanvim = {
  server = {
    settings = {
      ["rust-analyzer"] = {
         diagnostics = {
          disabled = {
           "macro-error"
          },
        },
        cargo = {
          buildScripts = { enable = true },
        },
        procMacro = {
          enable = true,
          ignored = {
            ["async-trait"] = { "async_trait" },
            ["napi-derive"] = { "napi" },
            ["async-recursion"] = { "async_recursion" },
          },
        },
      },
    },
  },
},


--dap-ui
require("dapui").setup(
    {
    controls = {
      element = "repl",
      enabled = true,
      icons = {
        disconnect = "",
        pause = "",
        play = "",
        run_last = "",
        step_back = "",
        step_into = "",
        step_out = "",
        step_over = "",
        terminate = ""
      }
    },
    element_mappings = {},
    expand_lines = true,
    floating = {
      border = "single",
      mappings = {
        close = { "q", "<Esc>" }
      }
    },
    force_buffers = true,
    icons = {
      collapsed = "",
      current_frame = "",
      expanded = ""
    },
    layouts = {
      {
        elements = { {
            id = "scopes",
            size = 0.25
          },
          {
            id = "breakpoints",
            size = 0.25
          }, {
            id = "stacks",
            size = 0.25
          }, {
            id = "watches",
            size = 0.25
          } },
        position = "right",
        size = 35
      }, {
        elements = { {
            id = "repl",
            size = 0.5
          }, {
            id = "console",
            size = 0.5
          } },
        position = "bottom",
        size = 5
      } },
    mappings = {
      edit = "e",
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      repl = "r",
      toggle = "t"
    },
    render = {
      indent = 1,
      max_value_lines = 100
    }
  }
)








