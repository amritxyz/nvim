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
        highlight.Comment = { fg = color.border }
        highlight.TodoHighlight = { fg = color.bg_main, bg = color.gold, bold = true }
        highlight.FixHighlight = { fg = color.bg_main, bg = color.red_intense, bold = true }
        highlight.NoteHighlight = { fg = color.bg_main, bg = color.blue_intense, bold = true }
        highlight.InfoHighlight = { fg = color.bg_main, bg = color.green_intense, bold = true }
      end,
    }
    vim.cmd.colorscheme 'modus_operandi'
    -- TODO: kjsd

    vim.cmd [[
      augroup HighlightCommentsKeywords
        autocmd!
        autocmd BufEnter,BufReadPost * call matchadd("TodoHighlight", "\\vTODO")
        autocmd BufEnter,BufReadPost * call matchadd("FixHighlight",  "\\vFIX")
        autocmd BufEnter,BufReadPost * call matchadd("NoteHighlight", "\\vNOTE")
        autocmd BufEnter,BufReadPost * call matchadd("InfoHighlight", "\\vINFO")
      augroup END
    ]]
  end,
}
