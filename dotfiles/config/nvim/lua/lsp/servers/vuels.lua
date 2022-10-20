local M = {}

M.setup = function(lspconfig, capabilities, on_attach)
  lspconfig.vuels.setup({
    filetypes = {
      'vue',
    },
    capabilities = capabilities,
    on_attach = on_attach,
    init_options = {
      config = {
        css = {},
        emmet = {},
        html = {
          suggest = {},
        },
        javascript = {
          format = {},
        },
        stylusSupremacy = {},
        typescript = {
          format = {},
        },
        vetur = {
          completion = {
            autoImport = true,
            tagCasing = 'kebab',
            useScaffoldSnippets = false,
          },
          format = {
            defaultFormatter = {
              js = 'none',
              ts = 'none',
            },
            defaultFormatterOptions = {},
            scriptInitialIndent = false,
            styleInitialIndent = false,
          },
          useWorkspaceDependencies = false,
          validation = {
            script = true,
            style = true,
            template = true,
          },
        },
      },
    },
  })
end

return M
