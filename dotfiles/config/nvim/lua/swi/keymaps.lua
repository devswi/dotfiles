local M = {}

local Util = require("lazyvim.util")

---@type LazyKeysSpec[]
M.generals = {

  -- scroll window one line up/down
  -- https://stackoverflow.com/a/14308057
  { "<c-e>", "<c-x><c-e>", mode = "i" },
  { "<c-y>", "<c-x><c-y>", mode = "i" },

  -- select all
  { "<c-a>", "gg<S-v>G" },

  { "jk", "<esc>", mode = "i" },

  -- move cursor in insert mode
  { "<c-b>", "<Left>", mode = "i" },
  { "<c-f>", "<Right>", mode = "i" },

  -- center cursor
  -- cspell:disable-next-line
  { "n", "nzzzv" },
  -- cspell:disable-next-line
  { "N", "Nzzzv" },

  {
    "<leader>ad",
    "<cmd>lua require('util.cspell').add_word_to_c_spell_dictionary()<CR>",
    mode = "n",
    desc = "Add unknown to cspell dictionary",
  },

  { "<A-Down>", ":m .+1<CR>" },
  { "<A-Up>", ":m .-2<CR>" },
  { "<A-Down>", "<Esc>:m .+1<CR>==gi", mode = "i" },
  { "<A-Up>", "<Esc>:m .-2<CR>==gi", mode = "i" },
  { "<A-Down>", ":m '>+1<CR>gv=gv", mode = "v" },
  { "<A-Up>", ":m '<-2<CR>gv=gv", mode = "v" },

  -- reset lazyvim float term
  { "<leader>ft", false },
  { "<leader>fT", false },
  { "<c-/>", false, mode = { "n", "t" } },
  {
    "<c-\\>",
    function()
      Util.terminal.open(nil)
    end,
  },
  { "<c-\\>", "<cmd>close<cr>", mode = { "t" } },

  -- delete is not cut
  -- https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim/30423919#30423919
  -- Delete, d
  { "d", '"_d', mode = { "n", "x" } },
  { "D", '"_D', mode = { "n", "x" } },
  { "x", '"_x', mode = { "n", "x" } },
  { "X", '"_X', mode = { "n", "x" } },
  -- Cut, x
  { "x", "d", mode = { "n", "x" } },
  { "xx", "dd" },
  { "X", "D", mode = { "n", "x" } },

  -- Visual paste, don't yank
  -- changed to `x(visual)` only, see https://github.com/L3MON4D3/LuaSnip/issues/748#issuecomment-1407325131
  { "p", '"_dP', mode = "x" },
}

return M
