local api = vim.api

-- Fix highlight issue
api.nvim_create_autocmd('BufEnter', { command = [[syntax enable]] })

-- don't auto comment new line
api.nvim_create_autocmd('BufEnter', { command = [[set formatoptions-=cro]] })

-- remove whitespace on save
vim.cmd([[au BufWritePre * :%s/\s\+$//e]])

vim.cmd([[au BufNewFile,BufRead *.mdx set filetype=markdown]])
