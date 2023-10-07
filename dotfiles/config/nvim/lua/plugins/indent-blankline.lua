return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  main = 'ibl',
  opts = {
    indent = {
      char = '▏',
    },
    exclude = {
      filetypes = { 'help', 'alpha', 'neo-tree', 'Trouble', 'lazy', 'Outline', '' },
      buftypes = { 'terminal' },
    },
  },
}
