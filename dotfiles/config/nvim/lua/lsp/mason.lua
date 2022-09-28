local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

return {
  config_defaults = function()
    local on_attach = require('lsp.handlers').on_attach
    local capabilities = require('lsp.handlers').capabilities

    local jsonls = require('lsp.servers.jsonls')
    jsonls.setup(lspconfig, capabilities, on_attach)

    local lua = require('lsp.servers.sumneko_lua')
    lua.setup(lspconfig, capabilities, on_attach)

    local tsserver = require('lsp.servers.tsserver')
    tsserver.setup(lspconfig, capabilities, on_attach)

    local tailwind = require('lsp.servers.tailwindcss')
    tailwind.setup(lspconfig, capabilities, on_attach)

    local rust = require('lsp.servers.rust-analyzer')
    rust.setup(capabilities, on_attach)
  end,
  setup = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'tsserver',
        'jsonls',
        'sumneko_lua',
        'stylua',
        'tailwindcss',
        'rust-analyzer',
      },
    })
  end,
}
