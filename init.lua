require "config.set"
require "config.keymaps"

require "plugins.color"
require "plugins.telescope"
require "plugins.oil"
require "plugins.gitsigns"
require "plugins.lsp"
require "plugins.mason"
require "plugins.cmp"
require "plugins.harpoon"

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

local uv = vim.loop
local STATE_FILE = vim.fn.expand '~/.config/nvim/modus_state'

-- Read current state from file (default to light)
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

-- Apply colorscheme based on state
local function apply_theme(state)
  vim.cmd 'highlight clear'
  if state == 'light' then
    vim.opt.background = 'light'
    vim.cmd.colorscheme 'modus_operandi'
  else
    vim.opt.background = 'dark'
    vim.cmd.colorscheme 'modus_vivendi'
  end
end

-- Initial apply at startup
apply_theme(read_state())

-- ---- File watcher ----
local handle = uv.new_fs_event()
if handle then
  uv.fs_event_start(handle, STATE_FILE, {}, function(err)
    if err then
      return
    end
    vim.schedule(function()
      apply_theme(read_state())
    end)
  end)
end
