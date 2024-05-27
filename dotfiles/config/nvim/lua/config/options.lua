-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- cspell:disable

local opt = vim.opt

opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.autoindent = true
opt.expandtab = true
opt.smarttab = true

opt.list = false

opt.conceallevel = 0 --
opt.spelllang = { "en", "cjk" } -- disable spell check chinese

opt.cmdheight = 1 -- always display cmd line

opt.foldenable = true -- no fold to be applied when open a file
opt.foldlevel = 99 -- if not set this, fold will be everywhere
opt.foldlevelstart = 99
opt.foldcolumn = "1"

opt.backup = false
opt.backupskip = { "/tmp/*", "/private/tmp/*" }
opt.breakindent = true
opt.formatoptions:remove({ "c", "r", "o" })
opt.relativenumber = false
opt.diffopt = "filler,iwhite,internal,linematch:60,algorithm:patience"
opt.splitkeep = "cursor"
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current

opt.foldmethod = "expr"

opt.mouse = "" -- disable mouse

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- https://github.com/LazyVim/LazyVim/discussions/2150
vim.g.root_spec = {
  "cwd",
}
