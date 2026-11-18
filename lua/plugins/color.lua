vim.pack.add({
  { src = 'https://codeberg.org/amrit/modus-themes.nvim.git' },
})

require('modus-themes').setup({
  style = 'modus_operandi',
  variant = 'default',

  line_nr_column_background = false,
  sign_column_background = false,

  styles = {
    functions = { italic = true },
    keywords = { italic = false }
  },

  on_colors = function(colors)
    colors.error = colors.red_faint
  end,

  on_highlights = function(highlight, color)
    highlight.Boolean              = { fg = color.green }
    highlight.Comment              = { fg = color.border, italic = true }
    highlight.Whitespace           = { fg = color.border }
    highlight.LineNrSep            = { fg = color.border }
    -- highlight.MsgArea = { fg = color.fg_status_line_active, bg = color.bg_status_line_active }
    -- highlight.LineNrSepAdd    = { fg = color.bg_added_fringe }
    -- highlight.LineNrSepChange = { fg = color.bg_changed_fringe }
    -- highlight.LineNrSepDelete = { fg = color.bg_removed_fringe }

    -- git signs: strong foreground colours that work on white
    highlight.GitSignsAdd          = { fg = color.green_intense, bg = color.none, bold = true }
    highlight.GitSignsChange       = { fg = color.yellow_warmer, bg = color.none, bold = true }
    highlight.GitSignsDelete       = { fg = color.red_intense, bg = color.none, bold = true }
    highlight.GitSignsChangedelete = { fg = color.yellow_warmer, bg = color.none, bold = true }
    highlight.GitSignsTopdelete    = { fg = color.red_intense, bg = color.none, bold = true }
    highlight.GitSignsUntracked    = { fg = color.green_intense, bg = color.none, bold = true }

    -- staged changes: same hues, lighter, so they are still distinguishable
    highlight.GitSignsStagedAdd    = { fg = color.green, bg = color.none }
    highlight.GitSignsStagedChange = { fg = color.yellow, bg = color.none }
    highlight.GitSignsStagedDelete = { fg = color.red, bg = color.none }
    highlight.CursorLineNr         = { fg = color.fg_main, bg = color.none }

    highlight.TodoHighlight        = { fg = color.gold, bg = 'none', bold = true, italic = true, nocombine = true, }
    highlight.FixHighlight         = { fg = color.red_intense, bg = 'none', bold = true, italic = true, nocombine = true, }
    highlight.NoteHighlight        = { fg = color.blue_intense, bg = 'none', bold = true, italic = true, nocombine = true, }
    highlight.InfoHighlight        = { fg = color.green_intense, bg = 'none', bold = true, italic = true, nocombine = true, }
  end,
})

vim.cmd.colorscheme('modus_operandi')

vim.api.nvim_create_augroup('HighlightCommentsKeywords', {})

vim.api.nvim_create_autocmd('BufWinEnter', {
  group = 'HighlightCommentsKeywords',
  callback = function()
    if vim.w.kw_matches then return end
    vim.w.kw_matches = true
    vim.fn.matchadd('TodoHighlight', [[\v(^|\s)\zsTODO\ze(\s|$)]])
    vim.fn.matchadd('FixHighlight', [[\v(^|\s)\zsFIXME\ze(\s|$)]])
    vim.fn.matchadd('NoteHighlight', [[\v(^|\s)\zsNOTE\ze(\s|$)]])
    vim.fn.matchadd('InfoHighlight', [[\v(^|\s)\zsINFO\ze(\s|$)]])
  end,
})
