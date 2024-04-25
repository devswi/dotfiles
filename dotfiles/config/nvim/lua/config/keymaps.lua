-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local keymap = vim.keymap.set
local opts = {
  noremap = true,
  silent = true,
}

keymap("n", "<C-a>", "gg<S-v>G")

keymap("n", "+", "<C-a>", opts)
keymap("n", "-", "<C-x>", opts)

-- jk
keymap("i", "jk", "<esc>", opts)

keymap("i", "<C-b>", "<Left>")
keymap("i", "<C-f>", "<Right>")

-- center cursor
-- cspell:disable-next-line
keymap("n", "n", "nzzzv", opts)
-- cspell:disable-next-line
keymap("n", "N", "Nzzzv", opts)

-- Move live up or down
-- moving
keymap("n", "<A-Down>", ":m .+1<CR>", opts)
keymap("n", "<A-Up>", ":m .-2<CR>", opts)
keymap("i", "<A-Down>", "<Esc>:m .+1<CR>==gi", opts)
keymap("i", "<A-Up>", "<Esc>:m .-2<CR>==gi", opts)
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<A-Up>", ":m '<-2<CR>gv=gv", opts)

keymap(
  "n",
  "<leader>ad",
  "<cmd>lua require('util.cspell').add_word_to_c_spell_dictionary()<CR>",
  { noremap = true, silent = true, desc = "Add unknown to cspell dictionary" }
)
