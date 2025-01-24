return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_install = { 'c', 'lua', 'rust', 'javascript', 'go', 'java', 'html', 'css', 'python', },
				sync_install = false,
				auto_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	}
}
