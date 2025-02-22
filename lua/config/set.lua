vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", space = ".", trail = "-", nbsp = "+", }

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

-- old
vim.opt.showmode = false
vim.opt.showcmd = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard:append('unnamedplus')
vim.opt.wildmode = 'longest,list,full'
-- vim.cmd('autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o')

-- vim.opt.guicursor = ""
-- vim.opt.tabstop = 2
-- vim.opt.softtabstop = 2
-- vim.opt.shiftwidth = 2
-- vim.opt.expandtab = true
