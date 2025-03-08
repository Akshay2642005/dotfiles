return{
  {
    'jedrzejboczar/toggletasks.nvim',
    requires = {
        'nvim-lua/plenary.nvim',
        'akinsho/toggleterm.nvim',
        'nvim-telescope/telescope.nvim/',
    },
    -- To enable YAML config support
    rocks = 'lyaml',
  }
}
