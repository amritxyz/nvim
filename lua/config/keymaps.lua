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
vim.keymap.set('n', '<leader>sn', function() builtin.find_files { cwd = vim.fn.stdpath 'config' } end, { desc = '[S]earch [N]eovim files' })
vim.keymap.set('n', '<leader>sb', ':Pick buffers<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)

vim.keymap.set("n", "<leader>ff", '<cmd>FzfLua files<CR>')
vim.keymap.set("n", "<leader>fg", '<cmd>FzfLua live_grep<CR>')
