return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local config = require("nvim-treesitter.configs")
			config.setup({
				ensure_install = { 'c', 'lua', 'rust', 'javascript', 'go' },
				auto_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	}
}
