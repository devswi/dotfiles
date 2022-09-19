local lspsaga = require('lspsaga')

lspsaga.init_lsp_saga({
  -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = 'rounded',
  -- when cursor in saga window you config these to move
  move_in_saga = { prev = '<C-p>', next = '<C-n>' },
  -- Error, Warn, Info, Hint
  -- use emoji like
  -- { "🙀", "😿", "😾", "😺" }
  -- or
  -- { "😡", "😥", "😤", "😐" }
  -- and diagnostic_header can be a function type
  -- must return a string and when diagnostic_header
  -- is function type it will have a param `entry`
  -- entry is a table type has these filed
  -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
  diagnostic_header = { ' ', ' ', ' ', '' },
  -- use emoji lightbulb in default
  code_action_icon = '💡',
  -- if true can press number to execute the codeaction in codeaction window
  code_action_num_shortcut = true,
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
    enable = false,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_icons = {
    def = '  ',
    ref = '諭 ',
    link = '  ',
  },
  -- preview lines of lsp_finder and definition preview
  max_preview_lines = 10,
  finder_action_keys = {
    open = 'o',
    vsplit = 's',
    split = 'i',
    tabe = 't',
    quit = 'q',
    scroll_down = '<C-d>',
    scroll_up = '<C-u>', -- quit can be a table
  },
  code_action_keys = {
    quit = 'q',
    exec = '<CR>',
  },
  rename_action_quit = '<C-c>',
  symbol_in_winbar = {
    enable = false,
    show_file = false,
    separator = '  ',
  },
})

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true })
keymap('n', '[d', '<cmd>Lspsaga diagnostic_jump_next<CR>', opts)
keymap('n', ']d', '<cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
keymap('n', '[e', function()
  require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
keymap('n', ']e', function()
  require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)

-- go to definition
keymap('n', 'gd', vim.lsp.buf.definition, opts)

-- rename
keymap('n', 'gr', '<cmd>Lspsaga rename<CR>', opts)

-- Lsp finder
keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })
