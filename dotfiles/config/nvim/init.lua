require('core.options')

do
  local ok, _ = pcall(require, 'impatient')

  if not ok then
    vim.notify('impatient.nvim not installed', 'info')
  end
end

local mods = {
  'compiled',
  'core',
  'colorscheme',
}

for _, mod in ipairs(mods) do
  local ok, err = pcall(require, mod)

  if mod == 'compiled' and not ok then
    vim.notify('Run :PackerCompile!', 'info')
  elseif not ok then
    vim.notify(('Error loading %s..\n\n%s'):format(mod, err), 'error')
  end
end
