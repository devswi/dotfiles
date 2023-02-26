-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap('n', '+', '<C-a>', opts)
keymap('n', '-', '<C-x>', opts)

-- select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- jk
keymap('i', 'jk', '<esc>', opts)
