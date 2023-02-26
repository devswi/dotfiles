-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[au BufNewFile,BufRead *.mdx set filetype=markdown]])

local _ft = vim.api.nvim_create_augroup('FileTypeSettings', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'Outline',
  callback = function()
    vim.wo.signcolumn = 'no'
  end,
  group = _ft,
})
