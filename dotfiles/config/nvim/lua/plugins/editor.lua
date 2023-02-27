return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-cmdline' },
    opts = function(_, opts)
      local cmp = require('cmp')
      ---@diagnostic disable-next-line: missing-parameter
      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = 'cmdline' } }))
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
