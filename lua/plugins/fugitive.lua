return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "<leader>gs", ":Git<CR>", { desc = "Git status with Fugitive" })
	end,
}
