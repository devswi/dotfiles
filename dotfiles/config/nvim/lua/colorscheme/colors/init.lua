local config = require('config')
local colors = {}
local mod = 'colorscheme.colors.'

local supported_themes = config.supported_themes

for _, theme in pairs(supported_themes) do
  if theme == config.theme then
    colors = require(mod .. theme)
  end
end

if vim.tbl_isempty(colors) then
  return {}
end

return colors
