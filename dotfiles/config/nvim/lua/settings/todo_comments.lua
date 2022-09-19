local icons = require('colorscheme.icons')

require('todo-comments').setup({
  keywords = {
    FIX = {
      icon = icons.debug, -- icon used for the sign, and in search results
      color = '#DC2626', -- can be a hex color, or a named color (see below)
      alt = { 'FIXME', 'BUG', 'FIXIT', 'ISSUE', '!' }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = icons.check, color = '#2563EB' },
    HACK = { icon = icons.flame, color = '#7C3AED' },
    WARN = { icon = icons.warn, color = '#FBBF24', alt = { 'WARNING', 'XXX' } },
    PERF = { icon = icons.perf, alt = { '#FC9868', 'PERFORMANCE', 'OPTIMIZE', 'OPTIM' } },
    NOTE = { icon = icons.note, color = '#10B981', alt = { 'INFO' } },
  },
})
