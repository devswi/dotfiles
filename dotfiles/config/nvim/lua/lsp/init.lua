local status_ok, _ = pcall(require, 'lspconfig')
if not status_ok then
  return
end

local mason_config = require('lsp.mason')
mason_config.setup()
mason_config.config_defaults()
require('lsp.handlers').setup()
require('lsp.functions')
