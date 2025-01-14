-- telescope.nvim
return {
  {
    "echasnovski/mini.pick"

  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim"
    },
    config = function()
      require("telescope").setup({
        pickers = {
          colorscheme = {
            enable_preview = true,
          },
          find_files = {
            hidden = false,
            find_command = {
              "rg",
              "--files",
              "--glob",
              "!{.git/*,.next/*,.svelte-kit/*,target/*,node_modules/*}",
              "--path-separator",
              "/",
            },
          },
        },
      })
      -- telescope setup
      local builtin = require("telescope.builtin")
      -- vim.keymap.set("n", "<C-p>", builtin.find_files, {})
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find_files" })
      vim.keymap.set(
        "n",
        "<C-p>",
        "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
        { desc = "Telescope find_files" }
      )
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live_grep" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              -- even more opts
            }),
          },
        },
      })
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          -- defaults for the opts then passed into telescope.find_files()
          find_command = {
            "rg",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          -- defaults for the opts then passed into telescope.live_grep()
          -- live_grep_command = {
          --   "rg",
          --   "--color=never",
          --   "--no-heading",
          --   "--with-filename",
          --   "--line-number",
          --   "--column",
          --   "--smart-case",
          -- },
          selection_caret = " ",
          entry_prefix = "  ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules", "target" },
          generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
          path_display = { "truncate" },
          winblend = 0,
          border = {},
          borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          color_devicons = true,                     -- whether or not to colorize file icons
          use_less = true,
          set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
          -- Developer configurations: Not meant for general override
          buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
        },
      })
    end,
  },
}
