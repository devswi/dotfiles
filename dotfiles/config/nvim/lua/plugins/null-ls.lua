local nullls = require('null-ls')
local builtins = nullls.builtins
local completion = builtins.completion
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics
local codeactions = builtins.code_actions

local prettier_files = {
  '.prettierrc.js',
  '.prettierrc.cjs',
  '.prettierrc.yaml',
  '.prettierrc.yml',
  '.prettierrc.json',
  'prettier.config.js',
  'prettier.config.cjs',
}

return {
  'nvimtools/none-ls.nvim',
  opts = {
    sources = {
      completion.luasnip,
      formatting.stylua,
      formatting.rustfmt,
      formatting.stylelint,
      -- formatting
      -- eslint 和 prettier 的顺序不能反
      formatting.eslint_d,
      formatting.prettier.with({
        condition = function(utils)
          return utils.has_file(prettier_files)
        end,
      }),
      -- diagnostics
      diagnostics.eslint_d,
      diagnostics.stylelint.with({
        condition = function(utils)
          return utils.has_file('.stylelintrc')
        end,
      }),
      -- code actions
      codeactions.eslint_d,
      codeactions.gitsigns,
    },
  },
}
