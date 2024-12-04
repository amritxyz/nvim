return {
	"nvim-telescope/telescope.nvim",  -- Telescope plugin

	dependencies = { "nvim-lua/plenary.nvim" },  -- Dependency for Telescope

	config = function()
		-- Key mappings for Telescope
		local builtin = require('telescope.builtin')

		-- Define key mappings
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
		vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope git files' })
		vim.keymap.set('n', '<leader>fh', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })  -- Grep search prompt
		end, { desc = 'Telescope grep string' })
	end,
}
