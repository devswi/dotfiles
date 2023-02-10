local M = {}

M.setup = function(lspconfig, _, on_attach)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
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
