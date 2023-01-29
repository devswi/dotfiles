local colors = require('catppuccin.palettes').get_palette('macchiato') -- fetch colors with API

return {
  bufferline = {
    fill = {
      bg = colors.base,
    },
  },
  bg = colors.base,
  white = colors.rosewater,
}
