local prettier = require('lazyvim.plugins.extras.formatting.prettier')

prettier[1] = {
  'williamboman/mason.nvim',
  opts = {
    ensure_installed = {
      'prettier',
    },
  },
}

return prettier
