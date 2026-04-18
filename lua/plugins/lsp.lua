vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig"
})

local servers = {
  "clangd",
  "cssls",
  "gopls",
  "html",
  "jdtls",
  "lua_ls",
  "pyright",
  "pyright",
  "rust_analyzer",
  "tailwindcss",
  "tinymist",
  "ts_ls",
  "zls"
}

for _, server in pairs(servers) do
  vim.lsp.enable(server)
end

vim.o.updatetime = 50
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local bufnr = event.buf
    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if not client.server_capabilities.documentHighlightProvider then
      return
    end

    local group = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })

    vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
      buffer = bufnr,
      group = group,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
      buffer = bufnr,
      group = group,
      callback = vim.lsp.buf.clear_references,
    })
  end,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT"
      },
      diagnostics = {
        globals = {
          "vim",
          "require"
        }
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true)
      },
      telemetry = {
        enable = false
      }
    },
  },
})

vim.cmd("set completeopt+=noselect")
