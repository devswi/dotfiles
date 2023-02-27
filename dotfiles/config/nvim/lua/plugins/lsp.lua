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
          virtual_text_str = ' ',
        },
      },
      widget_guides = {
        enabled = true,
      },
      dev_log = {
        enabled = false,
        open_cmd = 'tabedit',
      },
      dev_tools = {
        auto_open_browser = true,
      },
    },
  },
}
