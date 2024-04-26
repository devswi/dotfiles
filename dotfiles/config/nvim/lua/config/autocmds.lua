-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc", "markdown" },
  callback = function()
    vim.wo.conceallevel = 0
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = ".*rc",
  command = "setfiletype json",
})

local _ft = vim.api.nvim_create_augroup("FileTypeSettings", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "Outline", "neo-tree" },
  callback = function()
    require("ufo").detach()
    vim.opt_local.foldenable = false
    vim.wo.signcolumn = "no"
    ---@diagnostic disable-next-line: inject-field
    vim.b.miniindentscope_disable = true
  end,
  group = _ft,
})
