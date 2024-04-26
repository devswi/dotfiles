-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua

local lazyKeys = require("util.keymap").lazyKeys
local ok, keymaps = pcall(require, "swi.keymaps")
if ok then
  local generals = keymaps.generals
  lazyKeys(generals)
end
