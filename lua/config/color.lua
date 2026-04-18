vim.pack.add { "https://github.com/sainnhe/gruvbox-material" }
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_foreground = 'original'
-- vim.g.gruvbox_material_better_performance = true
vim.cmd.colorscheme('gruvbox-material')
-- vim.cmd.colorscheme('color')
vim.cmd.hi 'Comment gui=none'
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#000000" })
vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none" })
vim.api.nvim_set_hl(0, "Pmenu", { bg = "none" })
vim.api.nvim_set_hl(0, "PmenuSel", { bg = "#504945" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
vim.api.nvim_set_hl(0, "LspReferenceText", { bg = "#504945" })
vim.api.nvim_set_hl(0, "LspReferenceRead", { bg = "#504945" })
vim.api.nvim_set_hl(0, "LspReferenceWrite", { bg = "#504945" })

vim.api.nvim_set_hl(0, 'TodoHighlight', { fg = "#32302f", bg = '#fabd2f', bold = true })
vim.api.nvim_set_hl(0, 'FixHighlight',  { fg = "#32302f", bg = '#fb4934', bold = true })
vim.api.nvim_set_hl(0, 'NoteHighlight', { fg = "#32302f", bg = '#b8bb26', bold = true })
vim.api.nvim_set_hl(0, 'InfoHighlight', { fg = "#32302f", bg = '#fe8019', bold = true })
vim.cmd [[
  augroup HighlightCommentsKeywords
  autocmd!
    autocmd BufEnter,BufReadPost * call matchadd("TodoHighlight", "\\v(^|\\s)\\zsTODO\\ze(\\s|$)")
    autocmd BufEnter,BufReadPost * call matchadd("FixHighlight",  "\\v(^|\\s)\\zsFIX\\ze(\\s|$)")
    autocmd BufEnter,BufReadPost * call matchadd("NoteHighlight", "\\v(^|\\s)\\zsNOTE\\ze(\\s|$)")
    autocmd BufEnter,BufReadPost * call matchadd("InfoHighlight", "\\v(^|\\s)\\zsINFO\\ze(\\s|$)")
  augroup END
]]

-- require("mini.colors").setup({})
-- lua require('mini.colors').get_colorscheme():resolve_links():compress():add_cterm_attributes():add_terminal_colors():write({ name = 'colors' })
