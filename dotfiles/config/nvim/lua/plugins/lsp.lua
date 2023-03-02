return {
  -- add symbols-outline
  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    keys = { { '<leader>cs', '<cmd>SymbolsOutline<cr>', desc = 'Symbols Outline' } },
    opts = {
      -- add your options that should be passed to the setup() function here
      position = 'right',
    },
  },
  -- flutter
  {
    'akinsho/flutter-tools.nvim',
    keys = {
      { '<leader>cc', '<cmd>Telescope flutter commands<cr>', desc = 'Flutter commands list' },
    },
    config = function()
      require('telescope').load_extension('flutter')
    end,
    opts = {
      debugger = {
        enabled = false,
        run_via_dap = false,
      },
      lsp = {
        color = {
          enabled = true,
          background = false,
          background_color = nil,
          foreground = false,
          virtual_text = true,
          virtual_text_str = require('resource.icons').color .. ' ',
        },
      },
      widget_guides = {
        enabled = true,
      },
      dev_log = {
        enabled = true,
        open_cmd = 'tabedit',
      },
      dev_tools = {
        auto_open_browser = true,
      },
    },
  },
}
