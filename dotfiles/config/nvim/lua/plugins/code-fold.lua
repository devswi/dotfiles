return {
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
}
