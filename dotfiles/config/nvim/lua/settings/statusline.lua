local navic = require('nvim-navic')
local colors = require('colorscheme.colors.init')
local config = require('config')

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local icons = require('colorscheme.icons')

local file_name = {
  {
    'filetype',
    icon_only = true,
  },
  {
    'filename',
    path = 1,
    shorting_target = 100,
    file_status = true,
    symbols = { modified = ' ' .. icons.unsave, readonly = ' ' .. icons.readonly },
  },
}

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  symbols = { error = ' ', warn = ' ' },
  colored = true,
  update_in_insert = false,
  always_visible = true,
  color = { bg = colors.bg },
}

local diff = {
  'diff',
  colored = true,
  symbols = { added = '  ', modified = ' ', removed = ' ' },
  diff_color = {
    added = { fg = '#98be65' },
    modified = { fg = '#ecbe7b' },
    removed = { fg = '#ec5f67' },
  },
  cond = hide_in_width,
}

local function lsp_name()
  local active_clients = vim.lsp.get_active_clients()
  local client_names = {}
  for _, client in pairs(active_clients or {}) do
    local buf = vim.api.nvim_get_current_buf()
    if vim.lsp.buf_is_attached(buf, client.id) then
      table.insert(client_names, client.name)
    end
  end

  if not vim.tbl_isempty(client_names) then
    table.sort(client_names)
  end

  return string.format('%d', #client_names) .. ' server(s)'
end

local lsp_tbl = {
  function()
    return lsp_name()
  end,
  cond = function()
    return lsp_name() ~= nil
  end,
  icon = icons.lsp .. '',
  color = { bg = '#ff9e64', fg = '#24283b' },
}

-- add gps module to get the position information
-- local gps = require("nvim-gps")

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = config.theme,
    component_separators = '',
    section_separators = '',
    globalstatus = true,
    disabled_filetypes = {
      statusline = { 'alpha', 'aerial', 'toggleterm', 'dashboard', 'Trouble', 'Outline', 'packer', 'floaterm' },
      winbar = {
        'alpha',
        'aerial',
        'toggleterm',
        'dashboard',
        'Trouble',
        'NvimTree',
        'Outline',
        'packer',
        'floaterm',
        'dap-repl',
        'dapui_scopes',
      },
    },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {
      {
        'mode',
        fmt = function(str)
          return icons.ghost .. ' ' .. str
        end,
      },
      {
        require('noice').api.status.mode.get,
        cond = require('noice').api.status.mode.has,
        color = { bg = '#73daca', fg = '#24283b' },
        fmt = function(str)
          return icons.flame .. '' .. str
        end,
      },
    },
    lualine_b = {
      { 'branch', icon = '' },
      diff,
    },
    lualine_c = file_name,
    lualine_x = {
      diagnostics,
      lsp_tbl,
    },
    lualine_y = {
      {
        'fileformat',
        symbols = {
          unix = icons.unix, -- 
          dos = icons.dos,
          mac = icons.mac,
        },
      },
      { 'encoding' },
      {
        '%B',
        fmt = function(str)
          return '0x' .. str
        end,
      },
    },
    lualine_z = {
      { 'progress' },
      { 'location' },
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = file_name,
    lualine_x = { { 'fileformat' }, { 'encoding' }, { 'progress' }, { 'location' } },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  winbar = {
    lualine_a = {
      {
        'filetype',
        icon_only = true,
        color = { bg = colors.bg },
      },
      {
        'filename',
        path = 0,
        file_status = false,
        color = { gui = 'bold', bg = colors.bg, fg = colors.white },
      },
    },
    lualine_b = {
      {
        navic.get_location,
        cond = navic.is_available,
      },
    },
  },
  extensions = {
    'nvim-tree',
  },
})
