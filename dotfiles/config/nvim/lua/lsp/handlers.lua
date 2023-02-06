local M = {}

M.setup = function()
  local icons = require('colorscheme.icons')

  local signs = {
    Error = icons.error .. ' ',
    Warn = icons.warn .. ' ',
    Hint = icons.hint .. ' ',
    Info = icons.info .. ' ',
  }

  for type, icon in pairs(signs) do
    local hl = 'DiagnosticSign' .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = 'DiagnosticDefault' .. type })
  end

  local diagnostic_config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = 'minimal',
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  }

  vim.diagnostic.config(diagnostic_config)

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
  })
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
local lsp_formatting = function(bufnr, is_dart)
  vim.lsp.buf.format({
    filter = function(client)
      -- apply whatever logic you want (in this example, we'll only use null-ls)
      return is_dart or client.name == 'null-ls'
    end,
    bufnr = bufnr,
  })
end

M.on_attach = function(client, bufnr)
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc') -- Use LSP as the handler for formatexpr.

  if client.server_capabilities.documentSymbolProvider then
    require('nvim-navic').attach(client, bufnr)
  end
  -- require('aerial').on_attach(client, bufnr)
  -- require('lsp_signature').on_attach()
  require('core.autocommand').lsp_autocmds(client, bufnr)
  require('lsp.keymaps').setup(client, bufnr)

  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true, buffer = bufnr }
  -- go to definition
  keymap('n', 'gd', vim.lsp.buf.definition, opts)

  keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', opts)
  keymap('n', '[d', vim.diagnostic.goto_prev, opts)
  keymap('n', ']d', vim.diagnostic.goto_next, opts)

  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr, client.name == 'dartls') -- use dartls not lsp
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        --[[ vim.lsp.buf.format({ async = false }) ]]
      end,
    })
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = false
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

M.capabilities = capabilities

return M
