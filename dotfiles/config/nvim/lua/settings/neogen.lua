local M = {}

M.setup = function()
  local neogen = require('neogen')
  neogen.setup({
    snippet_engine = 'luasnip',
    enabled = true,
    languages = {
      lua = {
        template = {
          annotation_convention = 'ldoc',
        },
      },
      rust = {
        template = {
          annotation_convention = 'rustdoc',
        },
      },
      javascript = {
        template = {
          annotation_convention = 'jsdoc',
        },
      },
      typescript = {
        template = {
          annotation_convention = 'tsdoc',
        },
      },
      typescriptreact = {
        template = {
          annotation_convention = 'tsdoc',
        },
      },
    },
  })
end

return M
