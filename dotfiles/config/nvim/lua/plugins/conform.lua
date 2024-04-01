return {
  {
    'stevearc/conform.nvim',
    enabled = false,
    opts = {
      formatters = {
        shfmt = {
          prepend_args = { '-i', '2', '-ci' },
        },
      },
      formatters_by_ft = {
        ['json'] = { 'prettier' },
        ['jsonc'] = { 'prettier' },
        ['yaml'] = { 'prettier' },
        ['markdown'] = { 'prettier' },
        ['markdown.mdx'] = { 'prettier' },
        ['graphql'] = { 'prettier' },
        ['handlebars'] = { 'prettier' },
      },
    },
  },
}
