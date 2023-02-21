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

    local css = require('lsp.servers.cssls')
    css.setup(lspconfig, capabilities, on_attach)

    local vue = require('lsp.servers.vuels')
    vue.setup(lspconfig, capabilities, on_attach)

    lspconfig.bashls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })

    lspconfig.marksman.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = {
        'markdown',
        'markdown.mdx',
        'mdx',
      },
    })

    lspconfig.html.setup({
      capabilities = capabilities,
    })

    lspconfig.emmet_ls.setup({
      capabilities = capabilities,
    })

    lspconfig.prismals.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end,
  setup = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      ensure_installed = {
        'bashls',
        'cssls',
        'html',
        'emmet_ls',
        'tsserver',
        'jsonls',
        'lua_ls',
        'tailwindcss',
        'rust_analyzer',
        'vuels',
        'marksman',
        'prismals',
      },
      automatic_installation = false,
    })
  end,
}
