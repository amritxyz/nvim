return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"folke/lazydev.nvim",
			-- ft = "lua",
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	config = function()
		require'lspconfig'.clangd.setup{}
		require'lspconfig'.rust_analyzer.setup{}
		require'lspconfig'.pyright.setup{}
		-- require'lspconfig'.java_language_server.setup{}
		-- vim.api.nvim_create_autocmd('LspAttach', {
		-- 	callback = function(args)
		-- 		local client = vim.lsp.get_client_by_id(args.data.client_id)
		-- 		if not client then return end
		--
		-- 		if client.supports_method('textDocument/rename') then
		-- 		end
		-- 		if client.supports_method('textDocument/implementation') then
		-- 		end
		-- 		if client.supports_method('textDocument/formatting') then
		-- 			vim.api.nvim_create_autocmd('BufWritePre', {
		-- 				buffer = args.buf,
		-- 				callback = function ()
		-- 					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
		-- 				end,
		-- 			})
		-- 		end
		-- 	end,
		-- })
	end,
}
