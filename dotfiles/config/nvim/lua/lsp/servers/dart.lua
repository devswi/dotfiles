local M = {}

M.setup = function()
  local on_attach = require('lsp.handlers').on_attach
  local capabilities = require('lsp.handlers').capabilities
  require('flutter-tools').setup({
    lsp = {
      on_attach = on_attach,
      capabilities = capabilities,
    },
  })
end

return M
