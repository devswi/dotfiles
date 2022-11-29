local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.colorProvider = { dynamicRegistration = false }

return {
  setup = function(lspconfig, _, on_attach)
    lspconfig.tailwindcss.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {
        'html',
        'markdown',
        'mdx',
        'javascript',
        'javascriptreact',
        'typescriptreact',
        'vue',
        'svelte',
      },
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
