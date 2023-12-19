return {
  {
    'folke/trouble.nvim',
    keys = { { 'gR', '<cmd>Trouble lsp_references<cr>', desc = 'References (Trouble)' } },
  },
  {
    'echasnovski/mini.surround',
    enabled = false,
  },
  {
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
}
