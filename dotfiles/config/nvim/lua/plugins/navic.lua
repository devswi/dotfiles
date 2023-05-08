local icons = require('resource.icons')

return {
  'SmiteshP/nvim-navic',
  opts = {
    separator = icons.indicator.right,
    highlight = true,
    depth_limit = 5,
  },
}
