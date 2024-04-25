local is_windows = vim.loop.os_uname().version:match("Windows")
local path_separator = is_windows and "\\" or "/"

local M = {}

function M.exists(filename)
  local stat = vim.loop.fs_stat(filename)
  return stat ~= nil
end

function M.join(...)
  return table.concat(vim.tbl_flatten({ ... }), path_separator):gsub(path_separator .. "+", path_separator)
end

--- Check if current directory is a git repo
---@return boolean
function M.is_git_repo()
  vim.fn.system("git rev-parse --is-inside-work-tree")
  return vim.v.shell_error == 0
end

--- Get root directory of git project
---@return string|nil
function M.get_git_root()
  return require("lazyvim.util").root.git()
end

--- Get root directory of git project or fallback to current directory
---@return string|nil
function M.get_root_directory()
  if M.is_git_repo() then
    return M.get_git_root()
  end

  return vim.fn.getcwd()
end

return M
