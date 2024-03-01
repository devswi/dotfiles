-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua

local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.expandtab = true
opt.smarttab = true

opt.list = false

opt.conceallevel = 0 --
opt.spelllang = { 'en', 'cjk' } -- disable spell check chinese

opt.cmdheight = 1 -- always display cmd line

opt.foldenable = true -- no fold to be applied when open a file
opt.foldlevel = 99 -- if not set this, fold will be everywhere
opt.foldlevelstart = 99
opt.foldcolumn = '1'

-- https://github.com/LazyVim/LazyVim/discussions/2150
vim.g.root_spec = {
  'cwd',
}
