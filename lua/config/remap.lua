vim.g.mapleader = ' '
vim.opt.mouse = ''

vim.keymap.set('n', '<leader>o', vim.cmd.Tex)

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

vim.keymap.set('n', 'J', 'mzJ`z')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
vim.keymap.set('n', '<leader>zig', '<cmd>LspRestart<cr>')

-- old #1
vim.keymap.set('n', '<C-p>', ':!pwd<CR>')
vim.keymap.set('v', '.', ':normal .<CR>')
vim.keymap.set('n', '<C-z>', ':q!<CR>')
vim.keymap.set('n', '<leader>v', ':vsplit <C-r>=expand("%:p:h").."/"<CR>', { silent = false })
vim.keymap.set('n', '<leader>b', ':split <C-r>=expand("%:p:h").."/"<CR>', { silent = false })
vim.keymap.set('n', '<C-s>', ':r ~/.config/nvim/snippets/<C-d>', { silent = true })
vim.keymap.set('n', '<leader>tt', ':0r ~/.config/nvim/lsnippets/<C-d>', { silent = true })

-- New autobind stuffs
vim.cmd([[autocmd BufNewFile  *.c 0r $HOME/.config/nvim/snippets/auto-load/main.c|normal G]])
vim.cmd([[autocmd BufNewFile  *.html 0r $HOME/.config/nvim/snippets/auto-load/html.html|normal G]])
vim.cmd([[autocmd BufNewFile  *.css 0r $HOME/.config/nvim/snippets/auto-load/css.css|normal G]])
vim.cmd([[autocmd BufNewFile  *.js 0r $HOME/.config/nvim/snippets/auto-load/js.js|normal G]])
vim.cmd([[autocmd BufNewFile  *.rs 0r $HOME/.config/nvim/snippets/auto-load/main.rs|normal G]])
vim.cmd([[autocmd BufNewFile  *.go 0r $HOME/.config/nvim/snippets/auto-load/main.go|normal G]])
vim.cmd([[autocmd BufNewFile  *.java 0r $HOME/.config/nvim/snippets/auto-load/main.java|normal Gddggf{i ]])

-- Custom key mappings for resizing splits
vim.keymap.set('n', '<leader>gg', ':Git blame<CR>')
vim.keymap.set('n', '<C-w>h', ':vertical resize -8<CR>')
vim.keymap.set('n', '<C-w>l', ':vertical resize +8<CR>')
vim.keymap.set('n', '<C-w>k', ':resize -5<CR>')
vim.keymap.set('n', '<C-w>j', ':resize +5<CR>')

vim.keymap.set({'n', 'v'}, '<leader>d', "\"_d")

-- This is going to get me cancelled
vim.keymap.set('i', '<C-c>', '<Esc>')
vim.keymap.set('n', '<Esc>', ':echo "" | messages clear<CR>')

vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')
-- vim.keymap.set('n', '<leader>f', vim.lsp.buf.format)

vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz')
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz')
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz')
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz')

vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

vim.keymap.set('n', '<leader>mr', '<cmd>CellularAutomaton make_it_rain<CR>');

-- Vim LSP stuffs
vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
-- vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format({ async = false })]])
