if not vim.g.vscode then
  return {}
end

vim.opt.timeoutlen = 1000

local lazykeys = require('util.keymap').lazykeys

local keys = {
  -- reset
  { '<leader>bd', '<nop>' },
  { '<leader>bD', '<nop>' },

  -- bindings
  { 'u',          ":call VSCodeNotify('undo')<cr>" },
  { '<c-r>',      ":call VSCodeNotify('redo')<cr>" },

  { 'H',          ":call VSCodeNotify('workbench.action.previousEditor')<cr>" },
  { 'L',          ":call VSCodeNotify('workbench.action.nextEditor')<cr>" },
  { 'gp',         ":call VSCodeNotify('editor.action.peekDefinition')<cr>" },
  { 'gP',         ":call VSCodeNotify('editor.action.peekTypeDefinition')<cr>" },
  { 'gcc',        ":call VSCodeNotify('editor.action.commentLine')<cr>" },
  { 'gr',         ":call VSCodeNotify('workbench.actions.view.problems')<cr>" },
  { '<leader>e',  ":call VSCodeNotify('workbench.view.explorer')<cr>" },
  { '<leader>ff', ":call VSCodeNotify('workbench.action.quickOpen')<cr>" },
  { '<leader>fp', ":call VSCodeNotify('workbench.action.openRecent')<cr>" },
  { '<leader>fn', ":call VSCodeNotify('workbench.action.files.newUntitledFile')<cr>" },
  { '<leader>wo', ":call VSCodeNotify('workbench.action.toggleZenMode')<cr>" },
  { '<leader>gg', ":call VSCodeNotify('workbench.view.scm')<cr>" },

  { ']d',         ":call VSCodeNotify('editor.action.marker.next')<cr>" },
  { '[d',         ":call VSCodeNotify('editor.action.marker.prev')<cr>" },
  { '<c-k>',      ":call VSCodeNotify('editor.action.triggerParameterHints')<cr>",   mode = { 'n', 'i' } },
  { '<leader>ca', ":call VSCodeNotify('editor.action.quickFix')<cr>" },
  { '<leader>cA', ":call VSCodeNotify('editor.action.sourceAction')<cr>" },
  { '<leader>cr', ":call VSCodeNotify('editor.action.rename')<cr>" },

  { '[h',         ":call VSCodeNotify('workbench.action.editor.previousChange')<cr>" },
  { ']h',         ":call VSCodeNotify('workbench.action.editor.nextChange')<cr>" },
}

vim.api.nvim_create_autocmd('User', {
  pattern = 'LazyVimKeymaps',
  callback = function()
    lazykeys(keys)
  end,
})

return {
  { import = 'lazyvim.plugins.extras.vscode' },
}
