return {
  'kosayoda/nvim-lightbulb',
  opts = function()
    return {
      -- LSP client names to ignore
      -- Example: {"sumneko_lua", "null-ls"}
      ignore = {},
      sign = {
        enabled = false,
        -- Priority of the gutter sign
        priority = 10,
      },
      float = {
        enabled = false,
        -- Text to show in the popup float
        text = '💡',
        win_opts = {},
      },
      virtual_text = {
        enabled = true,
        -- Text to show at virtual text
        text = '💡',
        -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
        hl_mode = 'replace',
      },
      status_text = {
        enabled = false,
        -- Text to provide when code actions are available
        text = '💡',
        -- Text to provide when no actions are available
        text_unavailable = '',
      },
      autocmd = {
        enabled = true,
        -- see :help autocmd-pattern
        pattern = { '*' },
        -- see :help autocmd-events
        events = { 'CursorHold', 'CursorHoldI' },
      },
    }
  end,
}
