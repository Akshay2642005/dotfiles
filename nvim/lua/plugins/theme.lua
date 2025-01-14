return {
  {
    "xiyaowong/transparent.nvim",
  },
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        undercurl = true,
        transparent = false,
        terminalColors = true,
        dimInactive = true,
        commentStyle = { italic = true },
        functionStyle = { italic = false },
        keywordStyle = { italic = false, bold = false },
        statementStyle = { italic = false, bold = false },
        typeStyle = { italic = false },
        colors = {
          theme = {
            ui = {
            }
          },
          palette = {
            dragonBlack4 = "#181616",
            waveBlue1 = "#181616",
          }
        },                     -- override default palette and theme colors
        overrides = function() -- override highlight groups
          return {}
        end,
      })
    end,
  },
  {
    -- Rose-pine - Soho vibes for Neovim
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      dark_variant = "main"
    }
  },
  {
    "vague2k/vague.nvim",
    config = function(_, opts)
      require("vague").setup({
        -- optional configuration here
        transparent = true,
        style = {
          -- "none" is the same thing as default. But "italic" and "bold" are also valid options
          boolean = "none",
          number = "none",
          float = "none",
          error = "none",
          comments = "none",
          conditionals = "none",
          functions = "none",
          headings = "bold",
          operators = "none",
          strings = "none",
          variables = "none",

          -- keywords
          keywords = "none",
          keyword_return = "none",
          keywords_loop = "none",
          keywords_label = "none",
          keywords_exception = "none",

          -- builtin
          builtin_constants = "none",
          builtin_functions = "none",
          builtin_types = "none",
          builtin_variables = "none",
        },
        colors = {
          func = "#bc96b0",
          keyword = "#787bab",
          -- string = "#d4bd98",
          string = "#8a739a",
          -- string = "#f2e6ff",
          -- number = "#f2e6ff",
          -- string = "#d8d5b1",
          number = "#8f729e",
          -- type = "#dcaed7",
        },
      })
      require("vague").setup(opts)
      --[[       vim.cmd("colorscheme vague") ]]
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "auto", -- latte, frappe, macchiato, mocha
        transparent = true,
        background = {    -- :h background
          light = "latte",
          dark = "mocha",
        },
        transparent_background = false, -- disables setting the background color.
        show_end_of_buffer = false,     -- shows the '~' characters after the end of buffers
        term_colors = false,            -- sets terminal colors (e.g. `g:terminal_color_0`)
        dim_inactive = {
          enabled = false,              -- dims the background color of inactive window
          shade = "dark",
          percentage = 0.15,            -- percentage of the shade to apply to the inactive window
        },
        no_italic = false,              -- Force no italic
        no_bold = false,                -- Force no bold
        no_underline = false,           -- Force no underline
        styles = {                      -- Handles the styles of general hi groups (see `:h highlight-args`):
          comments = { "italic" },      -- Change the style of comments
          conditionals = { "italic" },
          loops = {},
          functions = {},
          keywords = {},
          strings = {},
          variables = {},
          numbers = {},
          booleans = {},
          properties = {},
          types = {},
          operators = {},
          -- miscs = {}, -- Uncomment to turn off hard-coded styles
        },
        color_overrides = {},
        custom_highlights = {},
        default_integrations = true,
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          notify = false,
          mini = {
            enabled = true,
            indentscope_color = "",
          },
          -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
        },
      })

      -- setup must be called before loading
      vim.cmd.colorscheme "catppuccin"
    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        dark = "hard",
        light = "hard",
        transparent = true,
        contrast = "soft",
        palette_overrides = {},
        overrides = {},
        dim_inactive = true,
        terminal_colors = true,
        disable_background = false,
        disable_bold = false,
        styles = {
          comments = "italic",
          functions = "italic",
          keywords = "italic",
          strings = "NONE",
          variables = "NONE",
          numbers = "NONE",
          booleans = "NONE",
          properties = "NONE",
          types = "NONE",
          operators = "NONE",
        },
      })
    end
  },
  {
    "sho-87/kanagawa-paper.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      require("kanagawa-paper").setup({
        undercurl = true,
        transparent = false,
        gutter = false,
        dimInactive = true, -- disabled when transparent
        terminalColors = true,
        commentStyle = { italic = true },
        functionStyle = { italic = false },
        keywordStyle = { italic = false, bold = false },
        statementStyle = { italic = false, bold = false },
        typeStyle = { italic = false },
        colors = {
          palette = {
            sumiInk0 = "#181616",
            sumiInk4 = "#181616",
            sumiInk3 = "#181616",
            sumiInk1 = "#181616",
            waveBlue1 = "#181616",
            lotusInk0 = "#282727"
          },
        },                     -- override default palette and theme colors
        overrides = function() -- override highlight groups
          return {}
        end,
      })
    end,
  },
  {
    "mellow-theme/mellow.nvim"
  },
  {
    "0xstepit/flow.nvim",
    lazy = false,
    priority = 1000,
    tag = "v1.0.0",
    opts = {
      theme = {
        style = "dark",       --  "dark" | "light"
        contrast = "default", -- "default" | "high"
        transparent = true,   -- true | false
      },
      colors = {
        mode = "default", -- "default" | "dark" | "light"
        fluo = "green",   -- "pink" | "cyan" | "yellow" | "orange" | "green"
      },
    },
  },
}
