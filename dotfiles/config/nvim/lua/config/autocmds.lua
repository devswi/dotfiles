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

-- disable comment in new line
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  callback = function()
    vim.bo.formatoptions = 'jqlnt' -- see :help to-table
  end,
  group = _ft,
})

-- Disable the concealing in some file formats
-- The default conceallevel is 3 in LazyVim
vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'json', 'jsonc', 'markdown' },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})
