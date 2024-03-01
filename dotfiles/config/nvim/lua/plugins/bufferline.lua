return {
  'akinsho/bufferline.nvim',
  event = 'VeryLazy',
  opts = {
    options = {
      mode = 'tabs',
      diagnostics = false,
      always_show_bufferline = false,
      offsets = {
        {
          filetype = 'neo-tree',
          text = 'File Explorer',
          highlight = 'Directory',
          text_align = 'left',
        },
      },
    },
  },
}
