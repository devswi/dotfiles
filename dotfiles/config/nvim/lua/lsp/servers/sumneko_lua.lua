return {
  setup = function(lspconfig, capabilities, on_attach)
    local lua_runtime = {
      [vim.fn.expand('$VIMRUNTIME/lua')] = true,
      [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
    }
    for _, v in pairs(vim.api.nvim_get_runtime_file('', true)) do
      lua_runtime[v] = true
    end
    lspconfig.lua_ls.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      settings = {
        Lua = {
          runtime = {
            version = 'LuaJIT',
          },
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = lua_runtime,
            checkThirdParty = false,
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
}
