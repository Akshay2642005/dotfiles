-- Lazy.nvim
return {
  'xvzc/chezmoi.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = true,
  enabled = false,
  config = function()
    require("chezmoi").setup {
      -- your configurations
    }
  end
}
