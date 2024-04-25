-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

opt.cmdheight = 1 -- always display cmd line

-- https://github.com/LazyVim/LazyVim/discussions/2150
vim.g.root_spec = {
  "cwd",
}
