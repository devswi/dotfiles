local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
  return
end

indent_blankline.setup({
  indentLine_enabled = 1,
  char = '▏',
  filetype_exclude = {
    'alpha',
    'help',
    'startify',
    'dashboard',
    'packer',
    'neogitstatus',
    'NvimTree',
    'Trouble',
  },
  buftype_exclude = { 'terminal' },
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  show_end_of_line = false,
  space_char_blankline = ' ',
  show_current_context = true,
  show_current_context_start = false,
  context_char = '▏',
})
