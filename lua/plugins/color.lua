return {
  'https://codeberg.org/amrit/modus-themes.nvim.git',
  priority = 1000,
  config = function()
    require('modus-themes').setup {
      style = 'modus_operandi',
      variant = 'default',

      styles = {
        functions = { italic = true },
      },

      on_colors = function(colors)
        colors.error = colors.red_faint
      end,

      on_highlights = function(highlight, color)
        highlight.Boolean = { fg = color.green }
        highlight.Comment = { fg = color.border, italic = true }
        highlight.TodoHighlight = { fg = color.gold, bg = none, bold = true, italic = false, nocombine = true }
        highlight.FixHighlight = { fg = color.red_intense, bg = none, bold = true, italic = false, nocombine = true }
        highlight.NoteHighlight = { fg = color.blue_intense, bg = none, bold = true, italic = false, nocombine = true }
        highlight.InfoHighlight = { fg = color.green_intense, bg = none, bold = true, italic = false, nocombine = true }
      end,
    }
    vim.cmd.colorscheme 'modus_operandi'
    -- TODO: kjsd

    vim.cmd [[
      augroup HighlightCommentsKeywords
        autocmd!
        autocmd BufEnter,BufReadPost * call matchadd("TodoHighlight", "\\v(^|\\s)\\zsTODO\\ze(\\s|$)")
        autocmd BufEnter,BufReadPost * call matchadd("FixHighlight",  "\\v(^|\\s)\\zsFIX\\ze(\\s|$)")
        autocmd BufEnter,BufReadPost * call matchadd("NoteHighlight", "\\v(^|\\s)\\zsNOTE\\ze(\\s|$)")
        autocmd BufEnter,BufReadPost * call matchadd("InfoHighlight", "\\v(^|\\s)\\zsINFO\\ze(\\s|$)")
      augroup END
    ]]
  end,
}
