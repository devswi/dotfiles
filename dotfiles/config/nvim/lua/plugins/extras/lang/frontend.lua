-- vue
return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'pmizio/typescript-tools.nvim',
  },
  opts = {
    servers = {
      tsservercontext = {},
    },
    setup = {
      tsservercontext = function(_, opts)
        local lspconfig = require('lspconfig')
        local util = require('lspconfig.util')
        local current_path = vim.fn.expand('%:p:h')
        local project_root = util.find_node_modules_ancestor(current_path)

        local vue_path = util.path.join(project_root, 'node_modules', 'vue')
        local is_vue = vim.fn.isdirectory(vue_path) == 1

        -- https://github.com/vuejs/language-tools/issues/3925#issuecomment-1975270857
        if is_vue then
          lspconfig.volar.setup({
            server = opts,
            filetypes = {
              'vue',
              'javascript',
              'javascript.jsx',
              'typescript',
              'typescript.tsx',
              'javascriptreact',
              'typescriptreact',
              'json',
            },
          })

          require('typescript-tools').setup({
            server = opts,
            settings = {
              tsserver_plugins = {
                '@vue/typescript-plugin',
              },
            },
            filetypes = {
              'vue',
              'javascript',
              'typescript',
            },
          })
        else
          require('typescript-tools').setup({
            server = opts,
          })
        end

        return true
      end,
    },
  },
  -- opts = function(_, opts)
  --
  --   if is_vue then
  --     opts.servers.tsserver = {
  --       autostart = false,
  --       root_dir = function()
  --         return false
  --       end,
  --       single_file_support = false,
  --     }
  --   end
  --
  --   return opts
  -- end,
}
