return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_install = { 'c', 'lua', 'rust', 'javascript', 'go', 'java', 'html', 'css' },
				auto_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	}
}
