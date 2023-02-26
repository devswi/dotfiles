return {
  'lukas-reineke/indent-blankline.nvim',
  event = { 'BufReadPost', 'BufNewFile' },
  opts = {
    char = '▏',
    context_char = '▏',
    filetype_exclude = { 'help', 'alpha', 'neo-tree', 'Trouble', 'lazy', 'Outline' },
    buftype_exclude = { 'terminal' },
    show_first_indent_level = true,
    show_trailing_blankline_indent = false,
    show_end_of_line = false,
    space_char_blankline = ' ',
    show_current_context = true,
    show_current_context_start = false,
  },
}
