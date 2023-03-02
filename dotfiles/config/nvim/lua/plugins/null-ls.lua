local nullls = require('null-ls')
local builtins = nullls.builtins
local completion = builtins.completion
local formatting = builtins.formatting
local diagnostics = builtins.diagnostics
local codeactions = builtins.code_actions

local with_root_file = function(regex)
  return function(utils)
    return utils.root_matches(regex)
  end
end

local with_eslint_files = function()
  return with_root_file('.eslintrc.(js|cjs|yaml|yml|json)')
end

local with_prettier_files = function()
  return with_root_file('.prettierrc.(js|cjs|yaml|yml|json)|prettier.config.(js|cjs)')
end

return {
  'jose-elias-alvarez/null-ls.nvim',
  opts = {
    sources = {
      completion.luasnip,
      formatting.stylua,
      formatting.rustfmt,
      -- formatting
      -- eslint 和 prettier 的顺序不能反
      formatting.eslint_d.with({
        condition = with_eslint_files(),
      }),
      formatting.prettier.with({
        condition = with_prettier_files(),
      }),
      -- diagnostics
      diagnostics.eslint_d.with({
        condition = with_eslint_files(),
      }),
      -- code actions
      codeactions.eslint_d,
      codeactions.gitsigns,
    },
  },
}
