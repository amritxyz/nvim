vim.g.mapleader = ' '

vim.keymap.set('n', '<C-s>', '<cmd>set spell!<CR>')
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('n', '<leader>ss', ':%s//g<Left><Left>', { noremap = true, silent = false })

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.keymap.set('n', '<leader>li', ':0r ~/.config/nvim/non_lua/f_license_snippets/<C-d>', { silent = true })
vim.keymap.set('n', '<leader>lI', ':0r ~/.config/nvim/non_lua/og_license_snippets/<C-d>', { silent = true })

vim.keymap.set('n', '<leader>e', ':Oil<CR>')
vim.keymap.set('n', '<leader>sf', function() require('snacks').picker.files() end)
vim.keymap.set('n', '<leader>sh', function() require('snacks').picker.help() end)
vim.keymap.set('n', '<leader>sg', function() require('snacks').picker.grep() end)
vim.keymap.set('n', '<leader><leader>', function() require('snacks').picker.grep_buffers() end)
vim.keymap.set('n', 'gd', function() require('snacks').picker.lsp_declarations() end)
vim.keymap.set('n', 'gi', function() require('snacks').picker.lsp_type_definitions() end)
vim.keymap.set('n', 'gr', function() require('snacks').picker.lsp_references() end)
vim.keymap.set('n', '<leader>sb', ':Pick buffers<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
