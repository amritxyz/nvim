return {
	"ellisonleao/gruvbox.nvim",

	config = function()
		function MyColor(color)
			color = color or "gruvbox"
			vim.cmd.colorscheme(color)

			-- Transparency
			vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
		end

		MyColor()
	end
}
