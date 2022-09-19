local M = {}

M.setup = function()
  local dap = require('dap')
  local install_root_dir = vim.fn.stdpath('data') .. '/mason'
  local extension_path = install_root_dir .. '/packages/codelldb/extension/'
  local codelldb_path = extension_path .. 'adapter/codelldb'

  dap.adapters.codelldb = {
    type = 'server',
    port = '13000',
    host = '127.0.0.3',
    executable = {
      command = codelldb_path,
      args = { '--port', '13000' },
    },
  }

  dap.configurations.c = {
    {
      type = 'codelldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      --program = '${fileDirname}/${fileBasenameNoExtension}',
      cwd = '${workspaceFolder}',
      terminal = 'integrated',
    },
  }

  dap.configurations.cpp = dap.configurations.c

  dap.configurations.rust = {
    {
      type = 'codelldb',
      request = 'launch',
      program = function()
        return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
      end,
      cwd = '${workspaceFolder}',
      terminal = 'integrated',
      sourceLanguages = { 'rust' },
      stopOnEntry = true,
    },
  }
end

return M
