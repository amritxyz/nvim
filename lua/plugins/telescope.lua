vim.pack.add({
  "https://github.com/ibhagwan/fzf-lua",
})

local fzf = require("fzf-lua")

fzf.setup({
  'ivy',

  defaults = { file_icons = false },
  files = { hidden = false },
  fzf_colors = { true, bg = '-1', },

  winopts = {
    height = 0.5,
    width = 1,
    border = "single",
    preview = {
      border = "single",
      layout = "horizontal",
      horizontal = "right:60%",
    },
  },

  keymap = {
    builtin = {
      ["<C-j>"] = "preview-page-down",
      ["<C-k>"] = "preview-page-up",
    },

    fzf = {
      ["ctrl-j"] = "down",
      ["ctrl-k"] = "up",
    },
  },

  file_ignore_patterns = {
    '.cache/',
    '.git/',
    '.github/',
    '.local/share/',
    '.local/state/',
    '.mozilla/',
    'build/',
    'dist',
    'node_modules',
    'share/',
    'state/',
    'target/',
    'yarn.lock',
  },
})

fzf.register_ui_select()

vim.keymap.set("n", "<leader>sh", fzf.helptags)
vim.keymap.set("n", "<leader>sk", fzf.keymaps)
vim.keymap.set("n", "<leader>sf", fzf.files)
vim.keymap.set("n", "<leader>sw", fzf.grep_cword)
vim.keymap.set("n", "<leader><leader>", fzf.live_grep)
vim.keymap.set("n", "<leader>sd", fzf.diagnostics_document)
vim.keymap.set("n", "<leader>sr", fzf.resume)
vim.keymap.set("n", "<leader>sb", fzf.buffers)

vim.keymap.set("n", "<leader>sn", function()
  fzf.files({ cwd = vim.fn.stdpath("config") })
end)

vim.keymap.set("n", "gd", fzf.lsp_definitions)
vim.keymap.set("n", "gI", fzf.lsp_incoming_calls)
vim.keymap.set("n", "gi", fzf.lsp_typedefs)
vim.keymap.set("n", "go", fzf.lsp_outgoing_calls)
vim.keymap.set("n", "gr", fzf.lsp_references)

vim.keymap.set("n", "gn", function()
  vim.diagnostic.jump({ count = 1 })
end)

vim.keymap.set("n", "gN", function()
  vim.diagnostic.jump({ count = -1 })
end)
