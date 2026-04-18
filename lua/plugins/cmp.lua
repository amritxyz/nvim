vim.pack.add({
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/rafamadriz/friendly-snippets",
  "https://github.com/Saghen/blink.cmp"
})

-- vim.cmd("set completeopt+=noselect")

-- auto completion
local acp = false

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip").setup({
  keep_roots = true,
  link_roots = true,
  link_children = true,
  exit_roots = false,
})

require("blink.cmp").setup({
  signature = {
    enabled = acp,
    window = {
      show_documentation = acp,
    }
  },
  keymap = {
    preset = "none",
    ["<C-d>"] = { "show", "show_documentation", "fallback" },
    ["<C-n>"] = { "show", "select_next", "fallback" },
    ["<C-p>"] = { "show", "select_prev", "fallback" },
    ["<C-y>"] = { "accept", "fallback" },
    ["<C-Space>"] = { "show", "fallback" },
    ["<C-b>"] = { "scroll_documentation_up", "fallback" },
    ["<C-f>"] = { "scroll_documentation_down", "fallback" },
    ["<C-l>"] = { "snippet_forward", "fallback" },
    ["<C-h>"] = { "snippet_backward", "fallback" },
  },
  fuzzy = { implementation = "lua" },
  completion = {
    documentation = { auto_show = acp },
    menu = { auto_show = acp }
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = "normal"
  },
})
