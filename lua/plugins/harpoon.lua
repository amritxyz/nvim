vim.pack.add({
  "https://github.com/nvim-lua/plenary.nvim",
  {
    src = "https://github.com/ThePrimeagen/harpoon",
    version = "harpoon2",
  },
})

local harpoon = require("harpoon") -- no pcall, so real errors show up
harpoon:setup()

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
vim.keymap.set("n", "<C-a>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon menu" })

vim.keymap.set("n", "<C-j>", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
vim.keymap.set("n", "<C-k>", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
vim.keymap.set("n", "<C-h>", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
vim.keymap.set("n", "<C-l>", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
