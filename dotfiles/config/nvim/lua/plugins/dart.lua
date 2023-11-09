-- flutter language server
return {
  {
    'akinsho/flutter-tools.nvim',
    config = function()
      require('flutter-tools').setup({
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
          on_attach = function(_, buffer)
            require('telescope').load_extension('flutter')
            vim.keymap.set(
              'n',
              '<leader>cc',
              '<cmd>Telescope flutter commands<CR>',
              { buffer = buffer, desc = 'Flutter Commands List' }
            )
          end,
        },
        widget_guides = {
          enabled = true,
        },
        dev_log = {
          enabled = true,
        },
        dev_tools = {
          auto_open_browser = true,
        },
      })
    end,
  },
}
