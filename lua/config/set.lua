vim.g.mapleader = ' '
vim.opt.breakindent = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.cursorline = true
vim.opt.expandtab = false
vim.opt.ignorecase = true
vim.opt.inccommand = "split"
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.mouse = ''
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.showmode = true
vim.opt.signcolumn = "yes"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.spell = false
vim.opt.spelllang = 'en_us'
vim.opt.tabstop = 8
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.undodir = vim.fn.expand '~/.local/state/nvim/undo/'
vim.opt.undofile = true
vim.opt.wrap = false
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.backspace = "indent,eol,start"
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.updatetime = 300
vim.opt.lazyredraw = true

vim.cmd [[autocmd BufWritePost /home/void/.local/dox/notes/mds/*.md silent !sh '...' --backup <afile>:p]]
vim.cmd [[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]]

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_set_hl(0, 'MiniStatuslineMode', {
  bold = false,
})

vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile', 'BufEnter' }, {
  pattern = '/tmp/bash-*',
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = 'en_us'
    vim.cmd 'syntax spell toplevel'
  end,
})
vim.api.nvim_create_user_command('W', 'w', {})

vim.api.nvim_set_hl(0, 'SpellBad', { undercurl = true, sp = '#DC322F' })
vim.api.nvim_set_hl(0, 'SpellCap', { undercurl = true, sp = '#B58900' })
vim.api.nvim_set_hl(0, 'SpellRare', { undercurl = true, sp = '#268BD2' })
vim.api.nvim_set_hl(0, 'SpellLocal', { undercurl = true, sp = '#2AA198' })
