vim.g.mapleader = " "
vim.keymap.set("n", "<leader>o", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<cr>")

vim.keymap.set("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

-- old #1
vim.keymap.set("v", ".", ":normal .<CR>")
vim.keymap.set("n", "<C-z>", ":q!<CR>")
vim.keymap.set('n', '<leader>h', ':vsplit <C-r>=expand("%:p:h").."/"<CR>', { silent = false })
vim.keymap.set('n', '<leader>b', ':split <C-r>=expand("%:p:h").."/"<CR>', { silent = false })

-- Custom key mappings for resizing splits
vim.keymap.set('n', '<leader>g', ':Git blame<CR>')
vim.keymap.set('n', '<C-w>h', ':vertical resize -8<CR>')
vim.keymap.set('n', '<C-w>l', ':vertical resize +8<CR>')
vim.keymap.set('n', '<C-w>k', ':resize -5<CR>')
vim.keymap.set('n', '<C-w>j', ':resize +5<CR>')

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader>ea", "oassert.NoError(err, \"\")<Esc>F\";a")

vim.keymap.set("n", "<leader>el", "oif err != nil {<CR>}<Esc>O.logger.Error(\"error\", \"error\", err)<Esc>F.;i")

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

-- old #2
-- Automatically deletes all trailing whitespace and newlines at end of file on save. & reset cursor position
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local currPos = vim.api.nvim_win_get_cursor(0)
    vim.cmd("%s/\\s\\+$//e")
    vim.cmd("%s/\\n\\+\\%$//e")
    vim.cmd("autocmd BufWritePre *.[ch] %s/\\%$/\\r/e")
    vim.cmd("autocmd BufWritePre *neomutt* %s/^--$/-- /e")
    vim.api.nvim_win_set_cursor(0, currPos)
  end
})
