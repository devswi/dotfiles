return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  vscode = false,
  config = function()
    -- disable codeium
    vim.g.codeium_disable_bindings = 1

    -- reset codeium
    vim.keymap.set('i', '<C-a>', function()
      return vim.fn['codeium#Accept']()
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-]>', function()
      return vim.fn['codeium#CycleCompletions'](1)
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-[>', function()
      return vim.fn['codeium#CycleCompletions'](-1)
    end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-x>', function()
      return vim.fn['codeium#Clear']()
    end, { expr = true, silent = true })
  end,
}
