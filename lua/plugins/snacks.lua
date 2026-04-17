vim.pack.add({
  "https://github.com/folke/snacks.nvim"
})

require("snacks").setup({
  animate = { enabled = false },
  bigfile = { enabled = true },
  dashboard = { enabled = false },
  dim = { enabled = false },
  explorer = { enabled = false },
  git = { enabled = false },
  image = { enabled = false },
  indent = { enabled = false },
  input = { enabled = true },
  layout = { enabled = false },
  notifier = { enabled = false },
  quickfile = { enabled = true },
  scope = { enabled = true },
  scratch = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  terminal = { enabled = false },
  toggle = { enabled = true },
  words = { enabled = false },
  zen = { enabled = true },

  picker = {
    icons = {
      files = {
        enabled = false
      },
    },
    layout = "custom",
    layouts = {
      custom = {
        layout = {
          box = "vertical",
          backdrop = false,
          row = -1,
          width = 0,
          height = 0.5,
          border = "top",
          title = " {title} {live} {flags}",
          title_pos = "left",
          {
            box = "horizontal",
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", width = 0.6, border = "left" },
          },
          { win = "input", height = 1, border = "top" },
        },
      },
    },
    sources = {
      files = {
        hidden = false,
        ignored = false,
        win = {
          input = {
            keys = {
              ["<S-h>"] = { "preview_scroll_left",  mode = {"n", "i"}},
              ["<S-j>"] = { "preview_scroll_down",  mode = {"n", "i"}},
              ["<S-k>"] = { "preview_scroll_up",    mode = {"n", "i"}},
              ["<S-l>"] = { "preview_scroll_right", mode = {"n", "i"}},
            },
          },
        },
        exclude = {
          "**/.git/*",
          "**/node_modules/*",
          "**/.yarn/cache/*",
          "**/.yarn/install*",
          "**/.yarn/releases/*",
          "**/.pnpm-store/*",
          "**/.idea/*",
          "build/*",
          "coverage/*",
          "dist/*",
          "hodor-types/*",
          "**/target/*",
          "**/public/*",
          "**/digest*.txt",
          "**/.node-gyp/**",
        },
      },
      grep = {
        hidden = false,
        ignored = false,
        exclude = {
          "**/.git/*",
          "**/node_modules/*",
          "**/.yarn/cache/*",
          "**/.yarn/install*",
          "**/.yarn/releases/*",
          "**/.pnpm-store/*",
          "**/.venv/*",
          "**/.idea/*",
          "**/.DS_Store",
          "**/yarn.lock",
          "build*/*",
          "coverage/*",
          "dist/*",
          "certificates/*",
          "hodor-types/*",
          "**/target/*",
          "**/public/*",
          "**/digest*.txt",
          "**/.node-gyp/**",
        },
      },
      grep_buffers = {},
    },
  },
})

