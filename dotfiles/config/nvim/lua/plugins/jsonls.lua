local schemas = require('lsp.jsonschemas')

return {
  'neovim/nvim-lspconfig',
  opts = {
    servers = {
      jsonls = {
        settings = {
          json = {
            schemas = schemas,
          },
        },
      },
    },
  },
}
