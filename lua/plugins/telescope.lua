return {
	"nvim-telescope/telescope.nvim",

	dependencies = { "nvim-lua/plenary.nvim" },

	config = function()
		require('telescope').setup {
			defaults = {
				file_ignore_patterns = {
					"node_modules", "dist", "yarn.lock", ".cache/", ".git/", ".mozilla/",
					".local/share/", "share/", ".local/state/", "state/"
					-- "build",
				},
				layout_config = {
					horizontal = {
						width = 0.9,
						height = 0.9,
						preview_width = 0.55,
					},
					vertical = {
						width = 0.95,
						height = 0.9,
					},
				},
			}
		}

		local builtin = require('telescope.builtin')

		vim.keymap.set('n', '<leader>ff', function()
			require('telescope.builtin').find_files({ hidden = true })
		end, { noremap = true, silent = true })

		vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = 'Telescope Git Files' })

		vim.keymap.set('n', '<leader>fh', builtin.live_grep, { desc = 'Telescope Live Grep' })

		vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Find existing buffers' })

		vim.keymap.set('n', '<leader>/', function()
			builtin.live_grep {
				grep_open_files = true,
				prompt_title = 'Live Grep in Open Files',
			}
		end, { desc = 'Find [/] in Current File' })
		vim.keymap.set('n', '<leader>fn', function()
			builtin.find_files { cwd = vim.fn.stdpath 'config' }
		end, { desc = 'Find Neovim files' })
	end,
}
