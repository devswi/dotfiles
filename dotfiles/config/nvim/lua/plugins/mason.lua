return {
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'bash-language-server',
        'css-lsp',
        'html-lsp',
        'emmet-ls',
        'tailwindcss-language-server',
        'rust-analyzer',
        'vue-language-server', -- volar for vue3.x
        'marksman',
        'prisma-language-server',
        'vetur-vls', -- vue2.x
        'unocss-language-server',
        'svelte-language-server',
      },
    },
  },
  {
    'mfussenegger/nvim-dap',
    config = function()
      local Config = require('lazyvim.config')
      -- vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual', guibg = 'NONE' })

      for name, sign in pairs(Config.icons.dap) do
        sign = type(sign) == 'table' and sign or { sign }
        vim.fn.sign_define(
          'Dap' .. name,
          { text = sign[1], texthl = sign[2] or 'DiagnosticInfo', linehl = sign[3], numhl = sign[3] }
        )
      end
    end,
  },
  {
    'jay-babu/mason-nvim-dap.nvim',
    opts = {
      automatic_installation = true,
      ensure_installed = {
        'js',
      },
    },
  },
  {
    'mxsdev/nvim-dap-vscode-js', -- debug
    opts = {
      debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
      debugger_cmd = { 'js-debug-adapter' },
      adapters = { 'pwa-node', 'pwa-chrome', 'node-terminal', 'pwa-extensionHost' },
    },
    config = function()
      local dap = require('dap')

      for _, language in ipairs({ 'typescript', 'javascript' }) do
        dap.configurations[language] = {
          {
            name = 'Launch',
            type = 'pwa-node',
            request = 'launch',
            program = '${file}',
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = { '<node_internals>/**' },
            protocol = 'inspector',
            console = 'integratedTerminal',
          },
          {
            name = 'Attach to node process',
            type = 'pwa-node',
            request = 'attach',
            rootPath = '${workspaceFolder}',
            processId = require('dap.utils').pick_process,
          },
          {
            name = 'Debug Main Process (Electron)',
            type = 'pwa-node',
            request = 'launch',
            runtimeExecutable = '${workspaceFolder}/node_modules/.bin/electron',
            windows = {
              runtimeExecutable = '${workspaceFolder}/node_modules/.bin/electron.cmd',
            },
            args = {
              '.',
              '--remote-debugging-port=9222',
            },
            outputCapture = 'std',
            rootPath = '${workspaceFolder}',
            cwd = '${workspaceFolder}',
            sourceMaps = true,
            skipFiles = { '<node_internals>/**' },
            protocol = 'inspector',
            console = 'integratedTerminal',
          },
        }
      end
    end,
  },
}
