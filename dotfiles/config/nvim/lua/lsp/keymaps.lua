local M = {}

local whichkey = require('which-key')

local function keymappings(client, bufnr)
  -- whichkey
  local keymap_l = {
    l = {
      name = 'LSP',
      r = {
        '<cmd>Trouble lsp_references<cr>',
        'Trouble References',
      },
      R = { '<cmd>Telescope lsp_references<CR>', 'References' },
      a = {
        '<cmd>Lspsaga code_action<CR>',
        'Code Action',
      },
      d = {
        '<cmd>TroubleToggle document_diagnostics<CR>',
        'Diagnostics',
      },
      D = {
        '<cmd>TroubleToggle workspace_diagnostics<CR>',
        'All Disgnostics',
      },
      i = {
        '<cmd>LspInfo<CR>',
        'Lsp Info',
      },
      s = {
        '<cmd>AerialToggle<CR>',
        'Document Symbols',
      },
      -- t = {
      --   '<cmd>LspToggleAutoFormat<CR>',
      --   'Toggle Format on Save',
      -- },
    },
  }
  if client.server_capabilities.documentFormattingProvider then
    keymap_l.l.f = { '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', 'Format Document' }
  end

  local keymap_v_l = {
    l = {
      name = 'LSP',
      a = { "<cmd>'<,'>lua vim.lsp.buf.range_code_action()<CR>", 'Code Action' },
    },
  }

  local opt = { buffer = bufnr, prefix = '<leader>' }
  whichkey.register(keymap_l, opt)

  opt = { mode = 'v', buffer = bufnr, prefix = '<leader>' }
  whichkey.register(keymap_v_l, opt)
end

function M.setup(client, bufnr)
  keymappings(client, bufnr)
end

return M
