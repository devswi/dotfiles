return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-cmdline' },
    opts = function(_, opts)
      local cmp = require('cmp')
      opts.enabled = function()
        local filetype = vim.bo.filetype
        if filetype == 'neo-tree-popup' or filetype == 'TelescopePrompt' then
          return false
        end
        if
          require('cmp.config.context').in_treesitter_capture('comment') == true
          or require('cmp.config.context').in_syntax_group('Comment')
        then
          return false
        else
          return true
        end
      end
      opts.experimental = {
        ghost_text = false, -- this feature conflict with copilot.vim's preview.
      }
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' },
        }, {
          { name = 'cmdline' },
        }),
      })
    end,
  },
  {
    'ggandor/flit.nvim',
    enabled = false,
  },
  {
    'ggandor/leap.nvim',
    enabled = false,
  },
  {
    'iamcco/markdown-preview.nvim',
    event = 'BufRead',
    config = function()
      vim.fn['mkdp#util#install']()
    end,
  },
}
