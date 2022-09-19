local _, catppuccin = pcall(require, 'catppuccin')

vim.g.catppuccin_flavour = 'macchiato'
catppuccin.setup({
  transparent_background = false,
  term_colors = false,
  styles = { -- TODO: style setting doesn't work
    comments = 'NONE',
    functions = 'bold',
    keywords = 'italic',
    strings = 'NONE',
    variables = 'NONE',
  },
  integrations = {
    treesitter = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = 'italic',
        hints = 'italic',
        warnings = 'italic',
        information = 'italic',
      },
      underlines = {
        errors = 'underline',
        hints = 'underline',
        warnings = 'underline',
        information = 'underline',
      },
    },
    lsp_trouble = false,
    cmp = true,
    lsp_saga = true,
    gitgutter = false,
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    neotree = {
      enabled = false,
      show_root = false,
      transparent_panel = false,
    },
    which_key = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    dashboard = false,
    neogit = false,
    vim_sneak = false,
    fern = false,
    barbar = false,
    bufferline = true,
    markdown = true,
    lightspeed = false,
    ts_rainbow = false,
    hop = true,
    notify = true,
    telekasten = true,
    symbols_outline = true,
  },
})

local colors = require('catppuccin.palettes').get_palette() -- fetch colors with API

return {
  bufferline = {
    fill = {
      bg = colors.base,
    },
  },
  bg = colors.base,
  white = colors.rosewater,
}
