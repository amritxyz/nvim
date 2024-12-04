return {
	"nvim-telescope/telescope.nvim",  -- Telescope plugin

	dependencies = { "nvim-lua/plenary.nvim" },  -- Dependency for Telescope

	config = function()
		require('telescope').setup {
			defaults = {
				file_ignore_patterns = {
					"node_modules", "dist", "yarn.lock", ".cache/", ".git/", ".mozilla/",
					".local/share/", "share/", ".local/state/", "state/"
					-- "build",
				},
			}
		}
		-- Key mappings for Telescope
		local builtin = require('telescope.builtin')

		-- Define key mappings
		-- Keybinding for Telescope find_files with hidden files and no ignore
		vim.keymap.set('n', '<leader>ff', function()
			require('telescope.builtin').find_files({ hidden = true })
		end, { noremap = true, silent = true })

		vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope git files' })

		vim.keymap.set('n', '<leader>fh', function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })  -- Grep search prompt
		end, { desc = 'Telescope grep string' })
	end,
}
