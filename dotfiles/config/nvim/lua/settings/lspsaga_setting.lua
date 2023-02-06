local M = {}

M.setup = function()
  require('lspsaga').setup({
    lightbulb = {
      enable = false,
    },
    symbol_in_winbar = {
      enable = false,
    },
  })
end

return M
