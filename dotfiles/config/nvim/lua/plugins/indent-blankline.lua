local skip_features_filetypes = require('util.ft').skip_features_filetypes

return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  main = 'ibl',
  opts = {
    indent = {
      char = '▏',
    },
    exclude = {
      filetypes = skip_features_filetypes,
      buftypes = { 'terminal' },
    },
  },
}
