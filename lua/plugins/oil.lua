vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
  columns = {
    "premissions",
    "icons"
  },
  win_options = {
    wrap = true,
  }
})
