return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			require('toggleterm').setup({
				size = 10,
				open_mapping = [[<c-t>]],
				hide_numbers = true,
				shade_filetypes = {},
				shade_terminals = true,
				shading_factor = 2,
				start_in_insert = true,
				insert_mappings = true,
				persist_size = true,
				direction = 'horizontal',
				close_on_exit = true,
				shell = vim.o.shell,
				float_opts = {
					border = 'single',
					winblend = 1,
					highlights = {
						border = 'Normal',
						background = 'Blur',
					},
				},
				winbar = {
					enabled = enable,
					name_formatter = function(term)
						return term.name
					end,
				}
			})
		end,
	}
}
