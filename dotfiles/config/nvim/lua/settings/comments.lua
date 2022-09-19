require('Comment').setup({
  padding = true,
  ignore = nil,
  mappings = {
    ---operator-pending mapping
    ---Includes `gcc`, `gcb`, `gc[count]{motion}` and `gb[count]{motion}`
    basic = true,
    ---extra mapping
    ---Includes `gco`, `gcO`, `gcA`
    extra = true,
    ---extended mapping
    ---Includes `g>`, `g<`, `g>[count]{motion}` and `g<[count]{motion}`
    extended = false,
  },
  toggler = {
    ---line-comment keymap
    line = 'gcc',
    ---block-comment keymap
    block = 'gbc',
  },
  ---LHS of operator-pending mapping in NORMAL + VISUAL mode
  ---@type table
  opleader = {
    ---line-comment keymap
    line = 'gc',
    ---block-comment keymap
    block = 'gb',
  },
  pre_hook = function(ctx)
    -- Only calculate commentstring for tsx filetypes
    if vim.bo.filetype == 'typescriptreact' then
      local U = require('Comment.utils')

      -- Determine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == U.ctype.linewise and '__default' or '__multiline'

      -- Determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == U.ctype.blockwise then
        location = require('ts_context_commentstring.utils').get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = require('ts_context_commentstring.utils').get_visual_start_location()
      end

      return require('ts_context_commentstring.internal').calculate_commentstring({
        key = type,
        location = location,
      })
    end
  end,
})

local keymap = vim.keymap.set

-- comment line
keymap('n', '<C-_>', '<CMD>lua require("Comment.api").toggle.linewise.current()<CR>')
keymap('n', '<C-\\>', '<CMD>lua require("Comment.api").toggle.blockwise.current()<CR>')
-- visual mode
keymap('x', '<C-_>', '<ESC><CMD>lua require("Comment.api").toggle.blockwise(vim.fn.visualmode())<CR>')
