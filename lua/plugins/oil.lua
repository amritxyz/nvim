vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
  columns = {
    "premissions",
    "icons"
  },
  view_options = {
    show_hidden = true,
  }
})
