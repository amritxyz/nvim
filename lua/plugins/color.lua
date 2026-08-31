vim.pack.add({
  { src = 'https://codeberg.org/amrit/modus-themes.nvim.git' },
})

require('modus-themes').setup({
  style = 'modus_operandi',
  variant = 'default',

  styles = {
    functions = { italic = true },
  },

  on_colors = function(colors)
    colors.error = colors.red_faint
  end,

  on_highlights = function(highlight, color)
    -- highlight.Boolean = { fg = color.green }
    -- highlight.Comment = { fg = color.border, italic = true }

    highlight.TodoHighlight = { fg = color.gold, bg = 'none', bold = true, italic = true, nocombine = true, }
    highlight.FixHighlight = { fg = color.red_intense, bg = 'none', bold = true, italic = true, nocombine = true, }
    highlight.NoteHighlight = { fg = color.blue_intense, bg = 'none', bold = true, italic = true, nocombine = true, }
    highlight.InfoHighlight = { fg = color.green_intense, bg = 'none', bold = true, italic = true, nocombine = true, }
  end,
})

vim.cmd.colorscheme('modus_operandi')

vim.api.nvim_create_augroup('HighlightCommentsKeywords', {})

vim.api.nvim_create_autocmd({ 'BufEnter', 'BufReadPost' }, {
  group = 'HighlightCommentsKeywords',
  callback = function()
    vim.fn.matchadd('TodoHighlight', [[\v(^|\s)\zsTODO\ze(\s|$)]])
    vim.fn.matchadd('FixHighlight', [[\v(^|\s)\zsFIXME\ze(\s|$)]])
    vim.fn.matchadd('NoteHighlight', [[\v(^|\s)\zsNOTE\ze(\s|$)]])
    vim.fn.matchadd('InfoHighlight', [[\v(^|\s)\zsINFO\ze(\s|$)]])
  end,
})
