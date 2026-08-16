vim.pack.add({
  {
    src = "https://github.com/ThePrimeagen/harpoon",
  },
})

local ok_mark, mark = pcall(require, "harpoon.mark")
local ok_ui, ui = pcall(require, "harpoon.ui")

if not (ok_mark and ok_ui) then
  return
end

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Harpoon add file" })
vim.keymap.set("n", "<C-a>", ui.toggle_quick_menu, { desc = "Harpoon menu" })

vim.keymap.set("n", "<C-j>", function()
  ui.nav_file(1)
end, { desc = "Harpoon file 1" })

vim.keymap.set("n", "<C-k>", function()
  ui.nav_file(2)
end, { desc = "Harpoon file 2" })

vim.keymap.set("n", "<C-h>", function()
  ui.nav_file(3)
end, { desc = "Harpoon file 3" })

vim.keymap.set("n", "<C-l>", function()
  ui.nav_file(4)
end, { desc = "Harpoon file 4" })
