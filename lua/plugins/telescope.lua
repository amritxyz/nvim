vim.pack.add({
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/nvim-lua/plenary.nvim"
})

require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    preview = {
      filesize_limit = 0.10,
      highlight_limit = 0.3,
    },
    file_ignore_patterns = {
      'node_modules',
      'dist',
      'yarn.lock',
      '.cache/',
      'target/',
      '.git/',
      '.mozilla/',
      '.local/share/',
      'share/',
      '.local/state/',
      'state/',
    },
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        width = 0.85,
        height = 0.8,
        preview_width = 0.55,
      },
      vertical = {
        width = 0.95,
        height = 0.9,
      },
    },
    mappings = {
      i = {
        ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
        ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
        ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
        ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
      },
      n = {
        ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
        ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
        ["<C-h>"] = require("telescope.actions").preview_scrolling_left,
        ["<C-l>"] = require("telescope.actions").preview_scrolling_right,
      },
    },
  },
  extensions = {
    ['ui-select'] = { require('telescope.themes').get_dropdown(), },
  },
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")

local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>sh', builtin.help_tags)
vim.keymap.set('n', '<leader>sk', builtin.keymaps)
vim.keymap.set('n', '<leader>sf', builtin.find_files)
vim.keymap.set('n', '<leader>sw', builtin.grep_string)
vim.keymap.set('n', '<leader><leader>', function () builtin.live_grep({ grep_open_files = true }) end)
vim.keymap.set('n', '<leader>sd', builtin.diagnostics)
vim.keymap.set('n', '<leader>sr', builtin.resume)
vim.keymap.set('n', '<leader>sb', builtin.buffers)
vim.keymap.set('n', '<leader>sn', function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end)
vim.keymap.set('n', 'gd', builtin.lsp_definitions)
vim.keymap.set('n', 'gI', builtin.lsp_incoming_calls)
vim.keymap.set('n', 'gi', builtin.lsp_type_definitions)
vim.keymap.set('n', 'go', builtin.lsp_outgoing_calls)
vim.keymap.set('n', 'gr', builtin.lsp_references)
