local M = {}

M.setup = function()
  require('ufo').setup({
    open_fold_hl_timeout = 0,
    provider_selector = function(_, _)
      return { 'treesitter', 'indent' }
    end,
  })
end

return M
