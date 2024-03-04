local vscode = require('util.vscode')
local vue_setting = vscode.get_setting('[vue]')

if vue_setting ~= nil then
  vim.b[0].autoformat = vue_setting['editor.formatOnSave']
else
  local formatOnSave = vscode.get_setting('editor.formatOnSave') or false
  vim.b[0].autoformat = formatOnSave
end
