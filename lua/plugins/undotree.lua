return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<leader>ut", ":UndotreeToggle<CR>", { desc = "Toggle UndoTree" })
	end,
}
