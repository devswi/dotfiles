local status_ok, configs = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  vim.notify('treesitter not found!')
  return
end

configs.setup({
  ensure_installed = {
    'toml',
    'bash',
    'css',
    'dockerfile',
    'html',
    'json',
    'javascript',
    'json',
    'json5',
    'lua',
    'markdown',
    'markdown_inline',
    'pug',
    'ruby',
    'scss',
    'tsx',
    'typescript',
    'rust',
    'vim',
    'vue',
    'yaml',
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { '' }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true, disable = { 'yaml' } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      -- Languages that have a single comment style
      typescript = '// %s',
      css = '/* %s */',
      scss = '/* %s */',
      html = '<!-- %s -->',
      svelte = '<!-- %s -->',
      vue = '<!-- %s -->',
      json = '',
    },
  },
  -- textobjects extension settings
  -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  textobjects = {
    swap = {
      enable = false,
    },
    select = {
      enable = true,
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = false, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    lsp_interop = {
      enable = false,
      border = 'none',
      peek_definition_code = {
        ['<leader>pf'] = '@function.outer',
        ['<leader>pF'] = '@class.outer',
      },
    },
  },
  textsubjects = {
    enable = false,
    keymaps = { ['.'] = 'textsubjects-smart', [';'] = 'textsubjects-big' },
  },
  playground = {
    enable = false,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
  rainbow = {
    enable = false,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
  },
  autotag = {
    enable = true,
    filetypes = {
      'html',
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
      'vue',
      'tsx',
      'jsx',
      'markdown.mdx',
      'markdown',
    },
  },
  -- matchup plugin
  -- https://github.com/andymass/vim-matchup
  matchup = {
    enable = false, -- mandatory, false will disable the whole extension
    -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    -- [options]
  },
  -- autopairs plugin
  autopairs = {
    enable = false,
  },
})
