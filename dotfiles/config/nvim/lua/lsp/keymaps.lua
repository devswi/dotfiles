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
      f = {
        "<cmd>lua require('telescope').extensions.flutter.commands()<cr>",
        'Flutter Tools',
      },
      t = {
        '<cmd>TroubleToggle document_diagnostics<CR>',
        'Diagnostics',
      },
      T = {
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
  local keymap_t = {
    t = {
      name = 'Trouble',
      t = {
        '<cmd>TroubleToggle document_diagnostics<CR>',
        'Diagnostics',
      },
      T = {
        '<cmd>TroubleToggle workspace_diagnostics<CR>',
        'All Disgnostics',
      },
    },
  }

  local keymap_v_l = {
    l = {
      name = 'LSP',
      a = { '<cmd>Lspsaga code_action<CR>', 'Code Action' },
    },
  }

  local opt = { buffer = bufnr, prefix = '<leader>' }
  whichkey.register(keymap_l, opt)
  whichkey.register(keymap_t, opt)

  opt = { mode = 'v', buffer = bufnr, prefix = '<leader>' }
  whichkey.register(keymap_v_l, opt)
end

function M.setup(client, bufnr)
  keymappings(client, bufnr)
end

return M
