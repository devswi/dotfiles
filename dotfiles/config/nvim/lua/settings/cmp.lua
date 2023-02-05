local M = {}

M.setup = function()
  vim.o.completeopt = 'menu,menuone,noinsert'

  local function has_words_before()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
  end

  local cmp = require('cmp')
  local lspkind = require('lspkind')
  local Rule = require('nvim-autopairs.rule')
  local npairs = require('nvim-autopairs')

  local luasnip = require('luasnip')
  local neogen = require('neogen')

  local lspkind_opts = {
    with_text = true,
    preset = 'codicons', -- need to install font https://github.com/microsoft/vscode-codicons/blob/main/dist/codicon.ttf
  }

  local source_mapping = {
    nvim_lsp = '[LSP]',
    luasnip = '[Snippet]',
    treesitter = '[TS]',
    nvim_lua = '[Vim]',
    path = '[Path]',
    buffer = '[Buffer]',
    crates = '[Crates]',
  }

  cmp.setup({
    completion = {
      completeopt = 'menu,menuone,noinsert',
    },
    view = {
      entries = { name = 'custom', selection_order = 'near_cursor' },
    },
    sources = {
      {
        name = 'nvim_lsp',
        priority = 99,
        entry_filter = function(entry)
          return require('cmp').lsp.CompletionItemKind.Snippet ~= entry:get_kind()
        end,
      },
      { name = 'nvim_lsp_signature_help', priority = 90 },
      { name = 'crates', priority = 90 },
      { name = 'luasnip', priority = 85 },
      { name = 'nvim_lua', priority = 80 },
      { name = 'path', priority = 10 },
      { name = 'buffer', priority = 0 },
    },
    duplicates = {
      buffer = 1,
      path = 1,
      nvim_lsp = 0,
      luasnip = 1,
    },
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    formatting = {
      format = function(entry, vim_item)
        vim_item.kind = lspkind.symbolic(vim_item.kind, lspkind_opts)
        local menu = source_mapping[entry.source.name]
        vim_item.menu = menu
        return vim_item
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(4),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-j>'] = cmp.mapping.select_next_item(),
      ['<C-k>'] = cmp.mapping.select_prev_item(),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      }),
      ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expandable() then
          luasnip.expand()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif neogen.jumpable() then
          neogen.jump_next()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        'i',
        's',
        'c',
      }),
      ['<S-Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif neogen.jumpable() then
          neogen.jump_next()
        else
          fallback()
        end
      end, {
        'i',
        's',
      }),
    },
  })

  cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' },
    },
  })

  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' },
      { name = 'cmdline' },
    }),
  })

  luasnip.config.set_config({
    history = true,
    -- Update more often, :h events for more info.
    updateevents = 'TextChanged,TextChangedI',
    enable_autosnippets = true,
  })
  luasnip.filetype_extend('javascript', { 'javascriptreact', 'html', 'css' })
  luasnip.filetype_extend('javascriptreact', { 'html', 'css' })
  luasnip.filetype_extend('typescript', { 'typescriptreact', 'html', 'css' })
  luasnip.filetype_extend('typescriptreact', { 'html', 'css' })
  luasnip.filetype_extend('vue', { 'html', 'css' })

  require('luasnip.loaders.from_vscode').load({
    include = {
      'html',
      'javascriptreact',
      'typescriptreact',
      'javascript',
      'typescript',
      'lua',
      'markdown',
      'ruby',
      'css',
      'rust',
      'shell',
      'vue',
    },
  })

  require('luasnip.loaders.from_vscode').load({
    paths = vim.fn.stdpath('config') .. '/snippets',
  })

  -- auto pairs setup
  npairs.setup()

  local cmp_autopairs = require('nvim-autopairs.completion.cmp')
  cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done({ map_char = { tex = '' } }))

  npairs.add_rule(Rule('r#"', '"#', 'rust'))
  npairs.add_rule(Rule('|', '|', 'rust'))
end

return M
