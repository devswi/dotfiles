local null_ls_status_ok, null_ls = pcall(require, 'null-ls')
if not null_ls_status_ok then
  vim.notify('Load null-ls failed')
  return
end

local with_root_file = function(...)
  local files = { ... }
  return function(utils)
    utils.root_has_file()
    return utils.root_has_file(files)
  end
end

local with_eslint_files = function()
  return with_root_file({
    '.eslintrc.js',
    '.eslintrc.cjs',
    '.eslintrc.yaml',
    '.eslintrc.yml',
    '.eslintrc.json',
    '.eslintrc',
  })
end

local with_prettier_files = function()
  return with_root_file({
    '.prettierrc.json',
    '.prettierrc.yml',
    '.prettierrc.yaml',
    '.prettierrc.js',
    '.prettierrc.cjs',
    'prettier.config.js',
    'prettier.config.cjs',
    '.prettierrc',
  })
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- local completion = null_ls.builtins.completion

local codeactions = null_ls.builtins.code_actions

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  })
end

null_ls.setup({
  debug = false,
  sources = {
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
  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          --[[ vim.lsp.buf.format({ async = false }) ]]
        end,
      })
    end
  end,
})
