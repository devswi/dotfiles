return {
  'github/copilot.vim',
  config = function()
    local keymap = vim.api.nvim_set_keymap
    local opts = {
      noremap = true,
      silent = true,
      expr = true,
    }
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true

    keymap('i', '<C-a>', 'copilot#Accept("<CR>")', opts)
  end,
}
