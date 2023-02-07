local M = {}

M.setup = function()
  local on_attach = require('lsp.handlers').on_attach
  local capabilities = require('lsp.handlers').capabilities

  local icons = require('colorscheme.icons')

  require('flutter-tools').setup({
    debugger = {
      enabled = true,
      run_via_dap = true,
    },
    lsp = {
      color = {
        enabled = true,
        background = false,
        background_color = nil,
        foreground = false,
        virtual_text = true,
        virtual_text_str = icons.kind_icons.Color,
      },
      on_attach = on_attach,
      capabilities = capabilities,
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
  })
end

return M
