vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim"
})

local servers = {
  "clangd", "lua_ls", "tinymist", "pyright", "gopls", "ts_ls", "html",
  "pyright", "tailwindcss", "cssls", "zls", "rust_analyzer"
}

require("mason").setup()
require("mason-lspconfig").setup()
require("mason-tool-installer").setup({
  ensure_installed = servers
})
