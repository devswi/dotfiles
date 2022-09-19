local modules = {
  'core.keymappings',
  'core.disabled',
  'core.plugins',
  'core.commands',
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)

  if not ok then
    vim.notify(('Error loading %s...\n\n%s'):format(module, err), 'error')
  end
end

require('core.autocommand').setup()
