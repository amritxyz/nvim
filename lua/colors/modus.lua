-- lua/colors/modus.lua
-- Lightweight Modus Operandi / Modus Vivendi (no plugin, no setup chain).

local M = {}

local palettes = {
  operandi = {
    bg_main                 = '#ffffff',
    bg_dim                  = '#f2f2f2',
    fg_main                 = '#000000',
    fg_dim                  = '#595959',
    fg_alt                  = '#193668',
    border                  = '#9f9f9f',
    border_highlight        = '#3b3b3b',
    red                     = '#a60000',
    red_cooler              = '#a0132f',
    red_faint               = '#7f0000',
    red_intense             = '#d00000',
    green                   = '#006800',
    green_cooler            = '#00663f',
    green_faint             = '#2a5045',
    green_intense           = '#008900',
    yellow                  = '#6f5500',
    yellow_warmer           = '#884900',
    yellow_cooler           = '#7a4f2f',
    yellow_faint            = '#624416',
    blue                    = '#0031a9',
    blue_warmer             = '#3548cf',
    blue_cooler             = '#0000b0',
    blue_faint              = '#003497',
    blue_intense            = '#0000ff',
    magenta                 = '#721045',
    magenta_warmer          = '#8f0075',
    magenta_cooler          = '#531ab6',
    cyan                    = '#005e8b',
    cyan_warmer             = '#3f578f',
    cyan_cooler             = '#005f5f',
    cyan_faint              = '#005077',
    rust                    = '#8a290f',
    gold                    = '#80601f',
    bg_red_intense          = '#ff8f88',
    bg_green_intense        = '#8adf80',
    bg_yellow_intense       = '#f3d000',
    bg_blue_intense         = '#bfc9ff',
    bg_magenta_intense      = '#dfa0f0',
    bg_hl_line              = '#dae5ec',
    bg_paren_match          = '#5fcfff',
    bg_active               = '#e0e0e0',
    fg_active               = '#0a0a0a',
    bg_status_line_active   = '#c8c8c8',
    fg_status_line_active   = '#0a0a0a',
    bg_status_line_inactive = '#e6e6e6',
    fg_status_line_inactive = '#585858',
    bg_tab_bar              = '#dfdfdf',
    bg_tab_current          = '#ffffff',
    bg_tab_other            = '#c2c2c2',
    fg_tab_other            = '#333333',
    bg_added                = '#c1f2d1',
    fg_added                = '#005000',
    fg_added_intense        = '#006700',
    bg_changed              = '#ffdfa9',
    fg_changed              = '#553d00',
    fg_changed_intense      = '#655000',
    bg_removed              = '#ffd8d5',
    fg_removed              = '#8f1313',
    fg_removed_intense      = '#aa2222',
    magenta_intense         = '#dd22dd',
    cyan_intense            = '#008899',
    yellow_intense          = '#808000',
  },
  vivendi = {
    bg_main                 = '#000000',
    bg_dim                  = '#1e1e1e',
    fg_main                 = '#ffffff',
    fg_dim                  = '#989898',
    fg_alt                  = '#c6daff',
    border                  = '#646464',
    border_highlight        = '#C4C4C4',
    red                     = '#ff5f59',
    red_cooler              = '#ff7f9f',
    red_faint               = '#ff9580',
    red_intense             = '#ff5f5f',
    green                   = '#44bc44',
    green_cooler            = '#00c06f',
    green_faint             = '#88ca9f',
    green_intense           = '#44df44',
    yellow                  = '#d0bc00',
    yellow_warmer           = '#fec43f',
    yellow_cooler           = '#dfaf7a',
    yellow_faint            = '#d2b580',
    blue                    = '#2fafff',
    blue_warmer             = '#79a8ff',
    blue_cooler             = '#00bcff',
    blue_faint              = '#82b0ec',
    blue_intense            = '#338fff',
    magenta                 = '#feacd0',
    magenta_warmer          = '#f78fe7',
    magenta_cooler          = '#b6a0ff',
    cyan                    = '#00d3d0',
    cyan_warmer             = '#4ae2f0',
    cyan_cooler             = '#6ae4b9',
    cyan_faint              = '#9ac8e0',
    rust                    = '#db7b5f',
    gold                    = '#c0965b',
    bg_red_intense          = '#9d1f1f',
    bg_green_intense        = '#2f822f',
    bg_yellow_intense       = '#7a6100',
    bg_blue_intense         = '#1640b0',
    bg_magenta_intense      = '#7030af',
    bg_hl_line              = '#2f3849',
    bg_paren_match          = '#2f7f9f',
    bg_active               = '#303030',
    fg_active               = '#f4f4f4',
    bg_status_line_active   = '#404040',
    fg_status_line_active   = '#f0f0f0',
    bg_status_line_inactive = '#2d2d2d',
    fg_status_line_inactive = '#969696',
    bg_tab_bar              = '#313131',
    bg_tab_current          = '#000000',
    bg_tab_other            = '#545454',
    fg_tab_other            = '#f7f7f7',
    bg_added                = '#00381f',
    fg_added                = '#a0e0a0',
    fg_added_intense        = '#80e080',
    bg_changed              = '#363300',
    fg_changed              = '#efef80',
    fg_changed_intense      = '#c0b05f',
    bg_removed              = '#4f1119',
    fg_removed              = '#ffbfbf',
    fg_removed_intense      = '#ff9095',
    magenta_intense         = '#ff66ff',
    cyan_intense            = '#00eff0',
    yellow_intense          = '#efef00',
  },
}

local names = { operandi = 'modus_operandi', vivendi = 'modus_vivendi' }

local function hl(group, spec)
  vim.api.nvim_set_hl(0, group, spec)
end

local function build(p)
  local c = setmetatable({
    none = 'NONE',
    error = p.red_faint,
    warning = p.yellow_cooler,
    info = p.blue_cooler,
    hint = p.cyan_faint,
    ok = p.green_cooler,
    visual = p.bg_magenta_intense,
    cursor = p.fg_main,
    comment = p.border,
  }, { __index = p })
  return c
end

local function apply_ui(c)
  local bg = c.bg_main
  -- UI
  hl('Normal', { fg = c.fg_main, bg = bg })
  hl('NormalNC', { fg = c.fg_main, bg = bg })
  hl('NormalFloat', { fg = c.fg_active, bg = c.bg_active })
  hl('FloatBorder', { fg = c.border_highlight, bg = bg })
  hl('FloatTitle', { fg = c.border_highlight, bg = bg })
  hl('Folded', { fg = c.green_faint, bg = c.bg_dim })
  hl('LineNr', { fg = c.fg_main, bg = bg })
  hl('LineNrAbove', { fg = c.fg_dim, bg = bg })
  hl('LineNrBelow', { fg = c.fg_dim, bg = bg })
  hl('LineNrSep', { fg = c.border })
  hl('CursorLineNr', { fg = c.fg_main, bg = 'NONE', bold = true })
  hl('SignColumn', { fg = c.fg_dim, bg = bg })
  hl('FoldColumn', { fg = c.fg_main, bg = bg })
  hl('CursorLine', { bg = c.bg_hl_line })
  hl('CursorColumn', { bg = c.bg_hl_line })
  hl('ColorColumn', { fg = c.fg_main, bg = c.bg_dim })
  hl('NonText', { fg = c.fg_dim })
  hl('SpecialKey', { fg = c.fg_dim })
  hl('Whitespace', { fg = c.border })
  hl('EndOfBuffer', { fg = c.fg_main })
  hl('Conceal', { fg = c.yellow_faint })
  hl('Cursor', { fg = c.bg_main, bg = c.cursor })
  hl('lCursor', { link = 'Cursor' })
  hl('TermCursor', { link = 'Cursor' })
  hl('Visual', { fg = c.fg_main, bg = c.visual })
  hl('VisualNOS', { link = 'Visual' })
  hl('MatchParen', { fg = c.fg_main, bg = c.bg_paren_match })
  hl('Directory', { fg = c.blue })
  hl('Title', { fg = c.fg_alt, bold = true })
  hl('Question', { fg = c.blue })
  hl('MoreMsg', { fg = c.blue })
  hl('ModeMsg', { fg = c.fg_dim, bold = true })
  hl('MsgArea', { fg = c.fg_main })
  hl('ErrorMsg', { fg = c.fg_main, bg = c.bg_red_intense })
  hl('WarningMsg', { fg = c.warning })
  hl('QuickFixLine', { fg = c.fg_main, bg = c.visual })

  -- Search
  hl('Search', { fg = c.fg_main, bg = c.bg_green_intense })
  hl('IncSearch', { fg = c.fg_main, bg = c.bg_yellow_intense })
  hl('CurSearch', { link = 'IncSearch' })
  hl('Substitute', { fg = c.fg_main, bg = c.bg_red_intense })

  -- Popup / completion
  hl('Pmenu', { fg = c.fg_active, bg = c.bg_active })
  hl('PmenuSel', { fg = c.bg_active, bg = c.fg_active })
  hl('PmenuSbar', { fg = c.fg_active, bg = c.bg_dim })
  hl('PmenuThumb', { link = 'Cursor' })
  hl('WildMenu', { fg = c.fg_main, bg = c.visual })

  -- Status / tabs / splits
  hl('StatusLine', { fg = c.fg_status_line_active, bg = c.bg_status_line_active })
  hl('StatusLineNC', { fg = c.fg_status_line_inactive, bg = c.bg_status_line_inactive })
  hl('TabLine', { fg = c.fg_tab_other, bg = c.bg_tab_other })
  hl('TabLineSel', { fg = c.fg_main, bg = c.bg_tab_current, bold = true })
  hl('TabLineFill', { fg = c.fg_dim, bg = c.bg_tab_bar })
  hl('WinBar', { link = 'TabLineSel' })
  hl('WinBarNC', { link = 'TabLine' })
  hl('VertSplit', { fg = c.border })
  hl('WinSeparator', { fg = c.border, bold = true })

  -- Diff
  hl('DiffAdd', { fg = c.fg_added, bg = c.bg_added })
  hl('DiffChange', { fg = c.fg_changed, bg = c.bg_changed })
  hl('DiffDelete', { fg = c.fg_removed, bg = c.bg_removed })
  hl('DiffText', { fg = c.fg_changed, bg = c.bg_changed })

  -- Spell
  hl('SpellBad', { sp = c.error, undercurl = true })
  hl('SpellCap', { sp = c.warning, undercurl = true })
  hl('SpellLocal', { sp = c.info, undercurl = true })
  hl('SpellRare', { sp = c.hint, undercurl = true })
end

local function apply_syntax(c)
  hl('Comment', { fg = c.comment, italic = true })
  hl('String', { fg = c.blue_warmer })
  hl('Character', { fg = c.blue_warmer })
  hl('Boolean', { fg = c.green, bold = true })
  hl('Number', { fg = c.blue_faint })
  hl('Float', { link = 'Number' })
  hl('Constant', { fg = c.fg_main })
  hl('Statement', { fg = c.magenta_cooler })
  hl('Conditional', { fg = c.magenta_cooler })
  hl('Repeat', { fg = c.magenta_cooler })
  hl('Keyword', { fg = c.magenta_cooler })
  hl('Exception', { fg = c.magenta_cooler })
  hl('StorageClass', { fg = c.magenta_cooler })
  hl('Structure', { fg = c.magenta_cooler })
  hl('Label', { fg = c.cyan })
  hl('Function', { fg = c.magenta, italic = true })
  hl('Identifier', { fg = c.cyan })
  hl('PreProc', { fg = c.red_cooler })
  hl('Include', { fg = c.red_cooler })
  hl('Define', { fg = c.red_cooler })
  hl('Macro', { fg = c.red_cooler })
  hl('PreCondit', { fg = c.red_cooler })
  hl('Type', { fg = c.cyan_cooler })
  hl('Typedef', { fg = c.cyan_warmer })
  hl('Special', { link = 'Type' })
  hl('SpecialChar', { fg = c.cyan_faint })
  hl('Operator', { fg = c.fg_main })
  hl('Delimiter', { fg = c.fg_main })
  hl('Tag', { fg = c.magenta })
  hl('Todo', { fg = c.magenta, bold = true })
  hl('Underlined', { fg = c.fg_alt, underline = true })
  hl('Error', { fg = c.fg_main, bg = c.bg_red_intense })

  -- Treesitter
  local links = {
    ['@variable'] = 'Identifier',
    ['@variable.builtin'] = 'Conditional',
    ['@variable.member'] = 'Identifier',
    ['@constant'] = 'Constant',
    ['@constant.builtin'] = 'Special',
    ['@constant.macro'] = 'Define',
    ['@module'] = 'Include',
    ['@module.builtin'] = 'Conditional',
    ['@label'] = 'Label',
    ['@string'] = 'String',
    ['@character'] = 'Character',
    ['@boolean'] = 'Boolean',
    ['@number'] = 'Number',
    ['@number.float'] = 'Float',
    ['@type'] = 'Type',
    ['@type.builtin'] = 'Type',
    ['@type.definition'] = 'Typedef',
    ['@attribute'] = 'PreProc',
    ['@attribute.builtin'] = 'PreProc',
    ['@property'] = 'Identifier',
    ['@function'] = 'Function',
    ['@function.builtin'] = 'Special',
    ['@function.call'] = 'Function',
    ['@function.macro'] = 'Macro',
    ['@function.method'] = 'Function',
    ['@function.method.call'] = 'Function',
    ['@operator'] = 'Operator',
    ['@keyword'] = 'Keyword',
    ['@keyword.coroutine'] = 'Keyword',
    ['@keyword.function'] = 'Function',
    ['@keyword.operator'] = 'Operator',
    ['@keyword.import'] = 'Include',
    ['@keyword.type'] = 'Type',
    ['@keyword.modifier'] = 'Keyword',
    ['@keyword.repeat'] = 'Repeat',
    ['@keyword.return'] = 'Keyword',
    ['@keyword.exception'] = 'Exception',
    ['@keyword.conditional'] = 'Conditional',
    ['@keyword.directive'] = 'PreProc',
    ['@punctuation.delimiter'] = 'Delimiter',
    ['@comment'] = 'Comment',
    ['@comment.todo'] = 'Todo',
    ['@tag'] = 'Label',
    ['@tag.attribute'] = 'Identifier',
    ['@tag.delimiter'] = 'Delimiter',
    ['@markup.raw'] = 'String',
    ['@markup.raw.block'] = 'String',
    ['@markup.link.url'] = 'Underlined',
    ['@markup.link.label'] = 'SpecialChar',
    ['@markup.heading'] = 'Title',
    ['@diff.plus'] = 'DiffAdd',
    ['@diff.minus'] = 'DiffDelete',
    ['@diff.delta'] = 'DiffChange',
  }
  for group, target in pairs(links) do
    hl(group, { link = target })
  end

  hl('@variable.parameter', { fg = c.cyan })
  hl('@variable.parameter.builtin', { fg = c.cyan_faint })
  hl('@string.documentation', { fg = c.green_faint, italic = true })
  hl('@string.regex', { fg = c.green_cooler })
  hl('@string.escape', { fg = c.yellow_faint })
  hl('@string.special', { fg = c.red_faint })
  hl('@string.special.path', { fg = c.blue })
  hl('@string.special.url', { fg = c.cyan_cooler })
  hl('@constructor', { fg = c.yellow_cooler })
  hl('@punctuation.bracket', { fg = c.fg_main })
  hl('@punctuation.special', { fg = c.fg_main })
  hl('@comment.error', { fg = c.error })
  hl('@comment.warning', { fg = c.warning })
  hl('@comment.note', { fg = c.hint })
  hl('@markup.strong', { bold = true })
  hl('@markup.italic', { italic = true })
  hl('@markup.strikethrough', { strikethrough = true })
  hl('@markup.underline', { underline = true })
  hl('@markup.quote', { italic = true })
  hl('@markup.link', { fg = c.cyan_cooler })
  hl('@markup.list', { fg = c.fg_main })
  hl('@markup.list.checked', { fg = c.green })
  hl('@markup.list.unchecked', { fg = c.yellow })
  hl('@markup.heading.1', { fg = c.blue, bold = true })
  hl('@markup.heading.2', { fg = c.yellow, bold = true })
  hl('@markup.heading.3', { fg = c.magenta, bold = true })
  hl('@markup.heading.4', { fg = c.green, bold = true })
  hl('@markup.heading.5', { fg = c.red, bold = true })
  hl('@markup.heading.6', { fg = c.cyan_warmer, bold = true })

  -- LSP semantic tokens
  hl('@lsp.type.variable', {})
  hl('@lsp.type.unresolvedReference', { undercurl = true, sp = c.error })
  hl('@lsp.typemod.variable.defaultLibrary', { link = '@variable.builtin' })
  hl('@lsp.typemod.function.defaultLibrary', { link = '@function.builtin' })
  hl('@lsp.typemod.variable.callable', { link = '@function' })
  hl('@lsp.typemod.variable.static', { link = '@constant' })
end

local function apply_lsp_diagnostics(c)
  hl('LspReferenceText', { fg = c.fg_main, bg = c.bg_blue_intense })
  hl('LspReferenceRead', { fg = c.fg_main, bg = c.bg_blue_intense })
  hl('LspReferenceWrite', { fg = c.fg_main, bg = c.bg_blue_intense })
  hl('LspInlayHint', { fg = c.comment, bg = c.bg_main, italic = true })
  hl('LspCodeLens', { fg = c.comment })
  hl('LspSignatureActiveParameter', { link = 'Visual' })

  for _, kind in ipairs { 'Error', 'Warn', 'Info', 'Hint', 'Ok' } do
    local col = ({ Error = c.error, Warn = c.warning, Info = c.info, Hint = c.hint, Ok = c.ok })[kind]
    hl('Diagnostic' .. kind, { fg = col, bold = true })
    hl('DiagnosticVirtualText' .. kind, { fg = col, bold = true })
    hl('DiagnosticUnderline' .. kind, { undercurl = true, sp = col })
    hl('DiagnosticSign' .. kind, { fg = col, bg = c.bg_main })
  end
  hl('DiagnosticUnnecessary', { fg = c.fg_dim })
end

local function apply_plugins(c)
  -- gitsigns
  local function sign(fg, bold)
    return { fg = fg, bg = 'NONE', bold = bold or false }
  end
  hl('GitSignsAdd', sign(c.green_intense, true))
  hl('GitSignsChange', sign(c.yellow_warmer, true))
  hl('GitSignsDelete', sign(c.red_intense, true))
  hl('GitSignsChangedelete', sign(c.yellow_warmer, true))
  hl('GitSignsTopdelete', sign(c.red_intense, true))
  hl('GitSignsUntracked', sign(c.green_intense, true))
  hl('GitSignsStagedAdd', sign(c.green))
  hl('GitSignsStagedChange', sign(c.yellow))
  hl('GitSignsStagedDelete', sign(c.red))

  -- fzf-lua
  hl('FzfLuaNormal', { link = 'Normal' })
  hl('FzfLuaBorder', { fg = c.border, bg = c.bg_main })
  hl('FzfLuaTitle', { fg = c.fg_dim, bg = c.bg_main })
  hl('FzfLuaHeaderBind', { fg = c.gold })
  hl('FzfLuaHeaderText', { fg = c.yellow_cooler })
  hl('FzfLuaPathColNr', { fg = c.cyan_cooler })
  hl('FzfLuaPathLineNr', { fg = c.green_cooler })
  hl('FzfLuaBufName', { fg = c.magenta_warmer })
  hl('FzfLuaBufNr', { fg = c.gold })
  hl('FzfLuaLiveSym', { fg = c.gold })

  -- nvim-cmp
  hl('CmpItemAbbr', { fg = c.fg_main })
  hl('CmpItemAbbrDeprecated', { fg = c.fg_dim, strikethrough = true })
  hl('CmpItemAbbrMatch', { fg = c.blue_warmer })
  hl('CmpItemAbbrMatchFuzzy', { fg = c.blue_warmer })
  hl('CmpItemMenu', { fg = c.fg_alt })
  hl('CmpItemKindDefault', { fg = c.fg_dim })

  -- TODO / FIX / NOTE / INFO words
  local kw = { bg = 'NONE', bold = true, italic = true, nocombine = true }
  hl('TodoHighlight', vim.tbl_extend('force', kw, { fg = c.gold }))
  hl('FixHighlight', vim.tbl_extend('force', kw, { fg = c.red_intense }))
  hl('NoteHighlight', vim.tbl_extend('force', kw, { fg = c.blue_intense }))
  hl('InfoHighlight', vim.tbl_extend('force', kw, { fg = c.green_intense }))
end

local function apply_terminal(c)
  local g = vim.g
  g.terminal_color_0, g.terminal_color_8 = c.bg_main, c.bg_dim
  g.terminal_color_7, g.terminal_color_15 = c.fg_main, c.fg_dim
  g.terminal_color_1, g.terminal_color_9 = c.red, c.red_intense
  g.terminal_color_2, g.terminal_color_10 = c.green, c.green_intense
  g.terminal_color_3, g.terminal_color_11 = c.yellow, c.yellow_intense
  g.terminal_color_4, g.terminal_color_12 = c.blue, c.blue_intense
  g.terminal_color_5, g.terminal_color_13 = c.magenta, c.magenta_intense
  g.terminal_color_6, g.terminal_color_14 = c.cyan, c.cyan_intense
end

-- TODO/FIX/NOTE/INFO word matching
local function setup_keyword_matches()
  local group = vim.api.nvim_create_augroup('HighlightCommentsKeywords', { clear = true })
  vim.api.nvim_create_autocmd('BufWinEnter', {
    group = group,
    callback = function()
      if vim.w.kw_matches then
        return
      end
      vim.w.kw_matches = true
      vim.fn.matchadd('TodoHighlight', [[\v(^|\s)\zsTODO\ze(\s|$)]])
      vim.fn.matchadd('FixHighlight', [[\v(^|\s)\zsFIXME\ze(\s|$)]])
      vim.fn.matchadd('NoteHighlight', [[\v(^|\s)\zsNOTE\ze(\s|$)]])
      vim.fn.matchadd('InfoHighlight', [[\v(^|\s)\zsINFO\ze(\s|$)]])
    end,
  })
end

local current

---@param style 'operandi'|'vivendi'
function M.load(style)
  local p = palettes[style]
  if not p then
    vim.notify('modus: unknown style ' .. tostring(style), vim.log.levels.ERROR)
    return
  end

  vim.cmd 'hi clear'
  if vim.fn.exists 'syntax_on' == 1 then
    vim.cmd 'syntax reset'
  end

  vim.o.termguicolors = true
  vim.o.background = style == 'operandi' and 'light' or 'dark'
  vim.g.colors_name = names[style]
  current = style

  local c = build(p)
  apply_ui(c)
  apply_syntax(c)
  apply_lsp_diagnostics(c)
  apply_plugins(c)
  apply_terminal(c)
  setup_keyword_matches()
end

function M.toggle()
  M.load(current == 'operandi' and 'vivendi' or 'operandi')
end

return M
