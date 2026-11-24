-- performance enhancement for fast startups
vim.loader.enable()

vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_gzip = 1
vim.g.loaded_tarPlugin = 1
vim.g.loaded_zipPlugin = 1
vim.g.loaded_2html_plugin = 1
vim.g.loaded_tutor_mode_plugin = 1

-- imports
require "config.set"
require "config.keymaps"

-- require "plugins.color"
require "plugins.fzf"
require "plugins.oil"
require "plugins.gitsigns"
require "plugins.lsp"
require "plugins.mason"
require "plugins.cmp"
require "plugins.harpoon"
require "plugins.treesitter"

local function pack_clean()
  local active_plugins = {}
  local unused_plugins = {}

  for _, plugin in ipairs(vim.pack.get()) do
    active_plugins[plugin.spec.name] = plugin.active
  end

  for _, plugin in ipairs(vim.pack.get()) do
    if not active_plugins[plugin.spec.name] then
      table.insert(unused_plugins, plugin.spec.name)
    end
  end

  if #unused_plugins == 0 then
    print("No used plugins.")
    return
  end

  local choice = vim.fn.confirm("Remove unused plugins?", "&Yes\n&No", 2)
  if choice == 1 then
    vim.pack.del(unused_plugins)
  end
end

vim.keymap.set("n", "<leader>pc", pack_clean)

local uv = vim.uv
local modus = require 'colors.modus'
local STATE_FILE = vim.fn.expand '~/.config/nvim/modus_state'

local function read_state()
  local f = io.open(STATE_FILE, 'r')
  if not f then
    return 'light'
  end
  local line = f:read '*l' or ''
  f:close()
  line = line:gsub('%s+', '')
  return line == 'dark' and 'dark' or 'light'
end

local function apply_theme(state)
  modus.load(state == 'light' and 'operandi' or 'vivendi')
  -- if state == 'light' then
  --   vim.opt.background = 'light'
  --   vim.cmd.colorscheme 'modus_operandi'
  -- else
  --   vim.opt.background = 'dark'
  --   vim.cmd.colorscheme 'modus_vivendi'
  -- end
end

local current = read_state()
apply_theme(current)

local watcher = uv.new_fs_event()

local function watch()
  if not watcher then
    return
  end
  watcher:stop()
  watcher:start(STATE_FILE, {}, vim.schedule_wrap(function(err)
    if err then
      return
    end
    local state = read_state()
    if state ~= current then
      current = state
      apply_theme(state)
    end
    watch()
  end))
end

watch()
