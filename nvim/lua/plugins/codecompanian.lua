return {
  {
    'mrjones2014/legendary.nvim',
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    -- sqlite is only needed if you want to use frecency sorting
    -- dependencies = { 'kkharji/sqlite.lua' }
  },
  {
    "olimorris/codecompanion.nvim", -- The KING of AI programming
    lazy = false,
    dependencies = {
      "j-hui/fidget.nvim",                    -- Display status
      "ravitemer/codecompanion-history.nvim", -- Save and load conversation history
      {
        "ravitemer/mcphub.nvim",              -- Manage MCP servers
        cmd = "MCPHub",
        build = "npm install -g mcp-hub@latest",
        config = true,
      },
      {
        "HakonHarnes/img-clip.nvim", -- Share images with the chat buffer
        event = "VeryLazy",
        cmd = "PasteImage",
        opts = {
          filetypes = {
            codecompanion = {
              prompt_for_file_name = false,
              template = "[Image]($FILE_PATH)",
              use_absolute_path = true,
            },
          },
        },
      },
      -- { "echasnovski/mini.pick", config = true },
      -- { "ibhagwan/fzf-lua", config = true },
    },
    opts = {
      extensions = {
        history = {
          enabled = true,
          opts = {
            keymap = "gh",
            save_chat_keymap = "sc",
            auto_save = false,
            auto_generate_title = true,
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            picker = "snacks",
            enable_logging = false,
            dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
          },
        },
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      prompt_library = {
        ["Test workflow"] = {
          strategy = "workflow",
          description = "Use a workflow to test the plugin",
          opts = {
            index = 4,
          },
          prompts = {
            {
              {
                role = "user",
                content =
                "Generate a Python class for managing a book library with methods for adding, removing, and searching books",
                opts = {
                  auto_submit = false,
                },
              },
            },
            {
              {
                role = "user",
                content = "Write unit tests for the library class you just created",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Create a TypeScript interface for a complex e-commerce shopping cart system",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Write a recursive algorithm to balance a binary search tree in Java",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Generate a comprehensive regex pattern to validate email addresses with explanations",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Create a Rust struct and implementation for a thread-safe message queue",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Write a GitHub Actions workflow file for CI/CD with multiple stages",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Create SQL queries for a complex database schema with joins across 4 tables",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Write a Lua configuration for Neovim with custom keybindings and plugins",
                opts = {
                  auto_submit = true,
                },
              },
            },
            {
              {
                role = "user",
                content = "Generate documentation in JSDoc format for a complex JavaScript API client",
                opts = {
                  auto_submit = true,
                },
              },
            },
          },
        },
      },
      strategies = {
        chat = {
          adapter = {
            name = "copilot",
            model = "claude-sonnet-4",
          },
          roles = {
            user = "Akshay",
          },
          keymaps = {
            send = {
              modes = {
                i = { "<C-CR>", "<C-s>" },
              },
            },
            completion = {
              modes = {
                i = "<C-x>",
              },
            },
          },
          slash_commands = {
            ["buffer"] = {
              keymaps = {
                modes = {
                  i = "<C-b>",
                },
              },
            },
            ["fetch"] = {
              keymaps = {
                modes = {
                  i = "<C-f>",
                },
              },
            },
            ["help"] = {
              opts = {
                max_lines = 1000,
              },
            },
            ["image"] = {
              keymaps = {
                modes = {
                  i = "<C-i>",
                },
              },
              opts = {
                dirs = { "~/Documents/Screenshots" },
              },
            },
          },
        },
        inline = {
          adapter = {
            name = "copilot",
            model = "gpt-4.1",
          },
        },
      },
      display = {
        action_palette = {
          provider = "default",
        },
        chat = {
          -- show_references = true,
          -- show_header_separator = false,
          -- show_settings = false,
        },
        diff = {
          provider = "mini_diff",
        },
      },
      opts = {
        log_level = "DEBUG",
      },
    },
    init = function()
      vim.cmd([[cab cc CodeCompanion]])
      require("legendary").keymaps({
        {
          itemgroup = "CodeCompanion",
          icon = "",
          description = "Use the power of AI...",
          keymaps = {
            {

              "<cmd>CodeCompanionActions<CR>",
              description = "Open the action palette",
              mode = { "n", "v" },
            },
            {
              "<Leader>aa",
              "<cmd>CodeCompanionChat Toggle<CR>",
              description = "Toggle a chat buffer",
              mode = { "n", "v" },
            },
            {
              "<LocalLeader>a",
              "<cmd>CodeCompanionChat Add<CR>",
              description = "Add code to a chat buffer",
              mode = { "v" },
            },
          },
        },
      })
      require("plugins.custom.spinner"):init()
    end,
  },
}
