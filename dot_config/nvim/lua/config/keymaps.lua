-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "+", "<C-a>")
map("n", "-", "<C-x>")

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Always center cursor
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Better escape
map("i", "jk", "<ESC>")

-- Move cursor in insert mode
map("i", "<C-b>", "<Left>")
map("i", "<C-f>", "<Right>")

-- Delete is not cut
-- https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim/30423919#30423919
map({ "n", "x" }, "d", '"_d')
map({ "n", "x" }, "D", '"_D')

map("n", "dd", '"_dd', { noremap = true })

map({ "n", "x" }, "x", "d")
map({ "n", "x" }, "X", "D")
map({ "n", "x" }, "xx", "dd")

-- Visual paste, don't yank
map("v", "p", '"_dP')

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<cr>", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<cr>", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<cr>", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<cr>", { desc = "Go to Right Window", remap = true })
