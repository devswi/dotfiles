return {
  'nvim-lualine/lualine.nvim',
  opts = function()
    local icons = require('resource.icons')
    local navic = require('nvim-navic')

    local hide_in_width = function()
      return vim.fn.winwidth(0) > 60
    end

    local diff = {
      'diff',
      colored = true,
      symbols = {
        added = icons.diff.added .. ' ',
        modified = icons.diff.modified .. ' ',
        removed = icons.diff.removed .. ' ',
      },
      diff_color = {
        added = { fg = '#98be65' },
        modified = { fg = '#ecbe7b' },
        removed = { fg = '#ec5f67' },
      },
      cond = hide_in_width,
    }

    local file_name = {
      {
        'filetype',
        icon_only = true,
        separator = '',
      },
      {
        'filename',
        path = 0,
        shorting_target = 50,
        file_status = true,
        symbols = { modified = ' ' .. icons.unsave, readonly = ' ' .. icons.readonly },
      },
    }

    local diagnostics = {
      'diagnostics',
      sources = { 'nvim_diagnostic' },
      sections = { 'error', 'warn' },
      symbols = { error = icons.diagnostics.error .. ' ', warn = icons.diagnostics.warn .. ' ' },
      colored = true,
      update_in_insert = true,
      always_visible = true,
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
      icon = icons.lsp,
      color = { bg = '#ff9e64', fg = '#24283b' },
    }

    return {
      options = {
        theme = 'tokyonight',
        icons_enbaled = true,
        component_separators = '',
        section_separators = '',
        globalstatus = true,
        disabled_filetypes = {
          statusline = {
            'starter',
            'lazy',
            'alpha',
            'aerial',
            'Trouble',
          },
          winbar = {
            'starter',
            'aerial',
            'Trouble',
            'neo-tree',
            'Outline',
            'lazy',
            'dap-repl',
            'dapui',
            'dapui_watches',
            'dapui_breakpoints',
            'dapui_scopes',
            'dapui_stacks',
            'dapui_console',
          },
        },
      },
      sections = {
        lualine_a = {
          {
            'mode',
            fmt = function(str)
              return icons.ghost .. ' ' .. str
            end,
          },
        },
        lualine_b = {
          { 'branch', shorten = true, icon = '' },
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
              unix = icons.system.unix .. ' ',
              dos = icons.system.dos .. ' ',
              mac = icons.system.mac .. ' ',
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
            color = { bg = '#24283b' },
          },
          {
            'filename',
            path = 1,
            file_status = false,
            color = { bg = '#24283b', fg = '#a9b1d6' },
          },
        },
        lualine_b = {
          {
            navic.get_location,
            cond = navic.is_available,
            color = { bg = '#24283b' },
          },
        },
      },
      inactive_winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      extensions = {
        'neo-tree',
      },
    }
  end,
}
