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

  -- vim.lsp.handlers['textDocument/hover'] = function(_, result, ctx, config)
  --   config = config or {
  --     border = 'single',
  --   }
  --   config.focus_id = ctx.method
  --   if not (result and result.contents) then
  --     return
  --   end
  --
  --   local markdown_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
  --   markdown_lines = vim.lsp.util.trim_empty_lines(markdown_lines)
  --   if vim.tbl_isempty(markdown_lines) then
  --     return
  --   end
  --
  --   local new = {}
  --   for _, line in pairs(markdown_lines) do
  --     line = line:gsub('(\\)(%p)', '%2')
  --     if line:find('&nbsp;') then
  --       line = line:gsub('&nbsp;', ' ')
  --     end
  --     if line:find('&lt;') then
  --       line = line:gsub('&lt;', '<')
  --     end
  --     if line:find('&gt;') then
  --       line = line:gsub('&gt;', '>')
  --     end
  --     if line:find('<pre>') then
  --       line = line:gsub('<pre>', '```')
  --     end
  --     if line:find('</pre>') then
  --       line = line:gsub('</pre>', '```')
  --     end
  --     if #line > 0 then
  --       table.insert(new, line)
  --     end
  --     print(line)
  --   end
  --
  --   local bufnr, window = vim.lsp.util.open_floating_preview(new, nil, config)
  --   vim.treesitter.start(bufnr, 'markdown')
  --
  --   local title = string.format('%%#HoverTitle# %s %s ', icons.kind_icons.File, 'Document')
  --
  --   vim.wo[window].conceallevel = 1
  --   vim.wo[window].concealcursor = 'ni'
  --   vim.wo[window].showbreak = 'NONE'
  --   vim.wo[window].winbar = table.concat({ title, '%#Normal# ' }, '')
  --
  --   local win_config = vim.api.nvim_win_get_config(window)
  --   vim.api.nvim_win_set_config(window, {
  --     height = win_config.height + 1,
  --     width = math.max(win_config.width, 8), -- + 2 for border
  --   })
  --   return bufnr, window
  -- end

  vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = 'rounded',
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

  keymap('n', 'K', require('noice.lsp').hover, opts)
  keymap('n', '[d', vim.diagnostic.goto_prev, opts)
  keymap('n', ']d', vim.diagnostic.goto_next, opts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

M.capabilities = capabilities

return M
