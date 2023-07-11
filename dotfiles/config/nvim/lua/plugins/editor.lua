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
    'iamcco/markdown-preview.nvim',
    event = 'BufRead',
    config = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  {
    'ggandor/leap.nvim',
    enabled = false,
  },
  {
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require('hop').setup({ keys = 'etovxqpdygfblzhckisuran' })
      local hop = require('hop')
      local directions = require('hop.hint').HintDirection
      vim.keymap.set('', 'f', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 'F', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
      end, { remap = true })
      vim.keymap.set('', 't', function()
        hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
      end, { remap = true })
      vim.keymap.set('', 'T', function()
        hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
      end, { remap = true })
    end,
  },
}
