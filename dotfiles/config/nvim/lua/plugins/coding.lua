return {
  {
    'folke/neoconf.nvim',
    enabled = false,
  },
  {
    'folke/trouble.nvim',
    keys = { { 'gR', '<cmd>Trouble lsp_references<cr>', desc = 'References (Trouble)' } },
  },
  {
    'echasnovski/mini.surround',
    enabled = false,
    vscode = false,
  },
  {
    'kylechui/nvim-surround',
    vscode = true,
    config = function()
      require('nvim-surround').setup()
    end,
  },
  {
    'Wansmer/symbol-usage.nvim',
    event = 'BufReadPre', -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
    config = function()
      require('symbol-usage').setup({
        disable = {
          filetypes = {
            'Starter',
          },
        },
      })
    end,
  },
  {
    'lukas-reineke/headlines.nvim',
    enabled = false,
  },
  {
    'folke/flash.nvim',
    keys = {
      {
        'S',
        mode = { 'n', 'o', 'x' },
        false,
      },
    },
  },
}
