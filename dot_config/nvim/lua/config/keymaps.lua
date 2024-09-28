-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")

-- Select all
vim.keymap.set("n", "<C-a>", "gg<S-v>G")

-- Always center cursor
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Better escape
vim.keymap.set("i", "jk", "<ESC>")

-- Move cursor in insert mode
vim.keymap.set("i", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-f>", "<Right>")

-- Delete is not cut
-- https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim/30423919#30423919
vim.keymap.set({ "n", "x" }, "d", '"_d')
vim.keymap.set({ "n", "x" }, "D", '"_D')

vim.keymap.set("n", "dd", '"_dd', { noremap = true })

vim.keymap.set({ "n", "x" }, "x", "d")
vim.keymap.set({ "n", "x" }, "X", "D")
vim.keymap.set({ "n", "x" }, "xx", "dd")

-- Visual paste, don't yank
vim.keymap.set("v", "p", '"_dP')
