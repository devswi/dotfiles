local M = {}

function M.find_nearest_node_modules()
  -- get path of current buffer
  local current_path = vim.fn.expand('%:p:h')
  -- Find node_modules upward from the current path
  local node_modules = vim.fn.finddir('node_modules', current_path .. ';')
  return node_modules
end

return M
