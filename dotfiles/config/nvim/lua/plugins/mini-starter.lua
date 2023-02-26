local function greeting(name)
  local date = os.date('*t')
  local hour = date.hour
  local greetings = {
    [1] = '  Sleep well',
    [2] = '  Good morning',
    [3] = '  Good afternoon',
    [4] = '  Good evening',
    [5] = '望 Good night',
  }
  local greetingIndex
  if hour == 23 or hour < 7 then
    greetingIndex = 1
  elseif hour < 12 then
    greetingIndex = 2
  elseif hour >= 12 and hour < 18 then
    greetingIndex = 3
  elseif hour >= 18 and hour < 21 then
    greetingIndex = 4
  elseif hour >= 21 then
    greetingIndex = 5
  end
  return greetings[greetingIndex] .. ', ' .. name
end

return {
  'echasnovski/mini.starter',
  opts = function()
    local username = 'shiwei'
    local greetingLabel = greeting(username)
    local pad = string.rep(' ', 0)
    local new_section = function(name, action, section)
      return { name = name, action = action, section = pad .. section }
    end

    local starter = require('mini.starter')
    --stylua: ignore
    local config = {
      evaluate_single = true,
      header = greetingLabel,
      items = {
        new_section("Find file",    "Telescope find_files", "Telescope"),
        new_section("Recent files", "Telescope oldfiles",   "Telescope"),
        new_section("Grep text",    "Telescope live_grep",  "Telescope"),
        new_section("init.lua",     "e $MYVIMRC",           "Config"),
        new_section("Lazy",         "Lazy",                 "Config"),
        new_section("New file",     "ene | startinsert",    "Built-in"),
        new_section("Quit",         "qa",                   "Built-in"),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(pad .. "░ ", false),
        starter.gen_hook.aligning("center", "center"),
      },
    }
    return config
  end,
  config = function(_, config)
    -- close Lazy and re-open when starter is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniStarterOpened',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    local starter = require('mini.starter')
    starter.setup(config)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local pad_footer = string.rep(' ', 0)
        starter.config.footer = pad_footer .. '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        pcall(starter.refresh)
      end,
    })
  end,
}
