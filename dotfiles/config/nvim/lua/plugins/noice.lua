return {
  'folke/noice.nvim',
  opts = {
    lsp = {
      progress = {
        enabled = false,
      },
    },
    presets = {
      bottom_search = false,
    },
    cmdline = {
      enabled = false,
      view = 'cmdline',
    },
    messages = {
      enabled = false,
    },
    popupmenu = {
      enabled = false, -- enables the Noice popupmenu UI
      ---@type 'nui'|'cmp'
      backend = 'cmp',
    },
  },
}
