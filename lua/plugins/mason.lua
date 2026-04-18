vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim",
  -- "https://github.com/nvim-java/nvim-java",
  -- "https://github.com/MunifTanjim/nui.nvim"
})

local servers = {
  "cssls",
  "gopls",
  "html",
  "lua_ls",
  "pyright",
  "tailwindcss",
  "tinymist",
  "ts_ls",
  -- "clangd",
  -- "pyright",
  -- "rust_analyzer"
  -- "zls",
  -- "jdtls"
}

require("mason").setup()
require("mason-lspconfig").setup({
  -- jdtls = function()
  --   require('java').setup {
  --   }
  --   require('lspconfig').jdtls.setup {
  --   }
  -- end,
})
require("mason-tool-installer").setup({
  ensure_installed = servers
})
