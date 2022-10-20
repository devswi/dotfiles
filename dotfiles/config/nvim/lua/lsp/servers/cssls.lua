local M = {}

M.setup = function(lspconfig, capabilities, on_attach)
  lspconfig.cssls.setup({
    capabilities = capabilities,
    settings = {
      css = {
        lint = {
          unknownAtRules = 'ignore',
        },
      },
      scss = {
        lint = {
          unknownAtRules = 'ignore',
        },
      },
    },
    on_attach = on_attach,
  })
end

return M
