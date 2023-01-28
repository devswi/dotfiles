-- Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- disable default keymap
keymap('', '<C-]>', '<Nop>', opts)
keymap('', '<C-t>', '<Nop>', opts)

-- Window Navigation
-- use tmux.nvim plugin
-- keymap('n', '<C-h>', '<C-w>h', opts)
-- keymap('n', '<C-j>', '<C-w>j', opts)
-- keymap('n', '<C-k>', '<C-w>k', opts)
-- keymap('n', '<C-l>', '<C-w>l', opts)
keymap('n', '<C-=>', '<C-w>=', opts)

-- Delete a word backwards
-- keymap('n', 'dw', 'vb"_d')

keymap('n', '+', '<C-a>')
keymap('n', '-', '<C-x>')

-- Select all
keymap('n', '<C-a>', 'gg<S-v>G', opts)

-- Resize with arrows
keymap('n', '<A-Up>', ':resize +2<CR>', opts)
keymap('n', '<A-Down>', ':resize -2<CR>', opts)
keymap('n', '<A-Left>', ':vertical resize +2<CR>', opts)
keymap('n', '<A-Right>', ':vertical resize -2<CR>', opts)

-- Navigate buffers
-- keymap('n', '<S-l>', ':bnext<CR>', opts)
-- keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- center cursor
keymap('n', 'n', 'nzzzv', opts)
keymap('n', 'N', 'Nzzzv', opts)

-- Insert --
-- Press jk fast to enter
keymap('i', 'jk', '<ESC>', opts)

-- paste wont replace the content in the clipboard
--[[ keymap('v', 'p', '"_dP', opts) ]]

keymap('i', '<C-b>', '<Left>')
keymap('i', '<C-f>', '<Right>')

keymap('n', ']<space>', 'o<ESC>', opts)
keymap('n', '[<space>', 'O<ESC>', opts)
