return {
  -- add symbols-outline
  {
    'simrat39/symbols-outline.nvim',
    cmd = 'SymbolsOutline',
    keys = { { '<leader>cs', '<cmd>SymbolsOutline<cr>', desc = 'Symbols Outline' } },
    opts = {
      -- add your options that should be passed to the setup() function here
      position = 'right',
    },
  },
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        cssls = {
          settings = {
            css = {
              lint = {
                unknownAtRules = 'ignore',
              },
            },
            scss = {
              lint = {
                unknownAtRules = 'ignore',
              },
            },
          },
        },
        tailwindcss = {
          root_dir = function(fname)
            local util = require('lspconfig').util
            return util.root_pattern(
              'tailwind.config.js',
              'tailwind.config.ts',
              'postcss.config.js',
              'postcss.config.ts'
            )(fname)
          end,
        },
        emmet_ls = {
          filetypes = {
            'html',
            'javascriptreact',
            'typescriptreact',
            'vue',
          },
        },
        volar = {
          filetypes = { 'vue', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json' },
          root_dir = function(fname)
            local util = require('lspconfig').util
            return util.root_pattern('vite.config.ts', 'vite.config.js')(fname)
          end,
        },
        tsserver = {
          root_dir = function(fname)
            local util = require('lspconfig').util
            local vue_root = util.root_pattern('vite.config.ts', 'vite.config.js')(fname)
            return not vue_root
              and (
                util.root_pattern('tsconfig.json', 'jsconfig.json', '.git')(fname)
                or util.find_git_ancestor(fname)
                or vim.loop.os_homedir()
              )
          end,
          single_file_support = false,
        },
      },
    },
  },
  {
    'NvChad/nvim-colorizer.lua',
    opts = {
      user_default_options = {
        tailwind = true,
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = true, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,
      },
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      { 'roobert/tailwindcss-colorizer-cmp.nvim', config = true },
    },
    opts = function(_, opts)
      -- original LazyVim kind icon formatter
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item) -- add icons
        return require('tailwindcss-colorizer-cmp').formatter(entry, item)
      end
    end,
  },
}
