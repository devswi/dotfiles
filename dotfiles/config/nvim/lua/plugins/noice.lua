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
    },
    messages = {
      enabled = false,
    },
    popupmenu = {
      enabled = true, -- enables the Noice popupmenu UI
      ---@type 'nui'|'cmp'
      backend = 'cmp',
    },
  },
}
