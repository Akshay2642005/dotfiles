return {
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = true,
    priority = 1000,
    opts = function()
      return {
        transparent = true,
      }
    end, 
  },
  {"rebelot/kanagawa.nvim",
    lazy = true,
    opts = function ()
      return{
        transparent = false,
      }
    end
  },
  {
    "2nthony/vitesse.nvim",
    dependencies = {
      "tjdevries/colorbuddy.nvim"
    },
    lazy = true,
    priority = 1000,
    opts = function ()
      return{
        transparent = true,
      }
    end
  },
  {
    "0xstepit/flow.nvim",
     lazy = false,
     priority = 1000,
     opts = {
      config = function()
    require("flow").setup{
      transparent = false, -- Set transparent background.
      fluo_color = "pink", --  Fluo color: pink, yellow, orange, or green.
      mode = "dim", -- Intensity of the palette: normal, bright, desaturate, or dark. Notice that dark is ugly!
      aggressive_spell = false, -- Display colors for spell check.
    }

    vim.cmd "colorscheme flow"
    end,
    }
  },
}
