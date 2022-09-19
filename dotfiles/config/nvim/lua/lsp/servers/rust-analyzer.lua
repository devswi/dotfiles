return {
  setup = function(capabilities, on_attach)
    local install_root_dir = vim.fn.stdpath('data') .. '/mason'
    local extension_path = install_root_dir .. '/packages/codelldb/extension/'
    local codelldb_path = extension_path .. 'adapter/codelldb'
    local liblldb_path = extension_path .. 'lldb/lib/liblldb.so'
    require('rust-tools').setup({
      tools = {
        autoSetHints = true,
        inlay_hints = {
          only_current_line = false,
          show_parameter_hints = true,
          parameter_hints_prefix = '◂ ',
          other_hints_prefix = '▸ ',
        },
        hover_actions = { auto_focus = true },
      },
      dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
      },
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
        standalone = false,
        -- cmd = rust_server:get_default_options().cmd,
        settings = {
          ['rust-analyzer'] = {
            diagnostics = {
              enable = true,
              -- https://github.com/rust-analyzer/rust-analyzer/issues/6835
              disabled = { 'unresolved-macro-call' },
              enableExperimental = true,
            },
            completion = {
              autoself = { enable = true },
              autoimport = { enable = true },
              postfix = { enable = true },
            },
            imports = {
              group = { enable = true },
              merge = { glob = false },
              prefix = 'self',
              granularity = {
                enforce = true,
                group = 'crate',
              },
            },
            cargo = {
              loadOutDirsFromCheck = true,
              autoreload = true,
              runBuildScripts = true,
              features = 'all',
            },
            procMacro = { enable = true },
            lens = {
              enable = false,
              run = { enable = true },
              debug = { enable = true },
              implementations = { enable = true },
              references = {
                adt = { enable = true },
                enumVariant = { enable = true },
                method = { enable = true },
                trait = { enable = true },
              },
            },
            hover = {
              actions = {
                enable = true,
                run = { enable = true },
                debug = { enable = true },
                gotoTypeDef = { enable = true },
                implementations = { enable = true },
                references = { enable = true },
              },
              links = { enable = true },
              documentation = { enable = true },
            },
            inlayHints = {
              enable = true,
              bindingModeHints = { enable = true },
              chainingHints = { enable = true },
              closingBraceHints = {
                enable = true,
                minLines = 0,
              },
              closureReturnTypeHints = { enable = 'always' },
              lifetimeElisionHints = { enable = 'skip_trivial' },
              typeHints = { enable = true },
            },
            checkOnSave = {
              enable = true,
              -- https://github.com/rust-analyzer/rust-analyzer/issues/9768
              command = 'clippy',
              features = 'all',
              allTargets = true,
            },
          },
        },
      },
    })
  end,
}
