local nullls = require('null-ls')
local builtins = nullls.builtins
local completion = builtins.completion
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics
local codeactions = builtins.code_actions

return {
  'jose-elias-alvarez/null-ls.nvim',
  opts = {
    sources = {
      completion.luasnip,
      formatting.stylua,
      formatting.rustfmt,
      -- formatting
      -- eslint 和 prettier 的顺序不能反
      formatting.eslint_d,
      formatting.prettier,
      -- diagnostics
      diagnostics.eslint_d,
      -- code actions
      codeactions.eslint_d,
      codeactions.gitsigns,
    },
  },
}
