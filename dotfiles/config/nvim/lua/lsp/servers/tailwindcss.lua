local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if cmp_nvim_lsp_ok then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.colorProvider = { dynamicRegistration = false }
end

return {
  setup = function(lspconfig, _, on_attach)
    lspconfig.tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { 'html', 'mdx', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'svelte' },
      init_options = {
        userLanguages = {
          eelixir = 'html-eex',
          eruby = 'erb',
        },
      },
      settings = {
        tailwindCSS = {
          lint = {
            cssConflict = 'warning',
            invalidApply = 'error',
            invalidConfigPath = 'error',
            invalidScreen = 'error',
            invalidTailwindDirective = 'error',
            invalidVariant = 'error',
            recommendedVariantOrder = 'warning',
          },
          experimental = {
            classRegex = {
              'tw`([^`]*)',
              'tw="([^"]*)',
              'tw={"([^"}]*)',
              'tw\\.\\w+`([^`]*)',
              'tw\\(.*?\\)`([^`]*)',
            },
          },
          validate = true,
        },
      },
    })
  end,
}
