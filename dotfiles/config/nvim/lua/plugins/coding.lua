return {
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async',
    },
    opts = {
      open_fold_hl_timeout = 0,
      provider_selector = function(_, _)
        return { 'treesitter', 'indent' }
      end,
    },
  },
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