local M = {}

M.setup = function()
  local colors = require('colorscheme.colors.init')
  require('bufferline').setup({
    options = {
      mode = 'tabs', -- set to "tabs" to only show tabpages instead
      numbers = 'ordinal', -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
      close_command = 'bdelete! %d', -- can be a string | function, see "Mouse actions"
      middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
      indicator_icon = '▎',
      buffer_close_icon = '',
      modified_icon = '●',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',
      --- name_formatter can be used to change the buffer's label in the bufferline.
      --- Please note some names can/will break the
      --- bufferline so use this at your discretion knowing that it has
      --- some limitations that will *NOT* be fixed.
      name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
        -- remove extension from markdown files for example
        if buf.name:match('%.md') then
          return vim.fn.fnamemodify(buf.name, ':t:r')
        end
      end,
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      tab_size = 18,
      diagnostics = false, --| "nvim_lsp" | "coc",
      diagnostics_update_in_insert = false,
      diagnostics_indicator = function(count)
        return '(' .. count .. ')'
      end,
      offsets = { { filetype = 'NvimTree', text = 'File Explorer', text_align = 'center' } }, -- | function , text_align = "left" | "center" | "right"}},
      show_buffer_icons = true, --| false, -- disable filetype icons for buffers
      show_buffer_close_icons = true, --| false,
      show_close_icon = false, --| false,
      show_tab_indicators = true, -- | false,
      persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
      -- can also be a table containing 2 custom separators
      -- [focused and unfocused]. eg: { '|', '|' }
      separator_style = 'thin', --| "slant" | "thick" | "thin" | { 'any', 'any' },
      enforce_regular_tabs = false, --| true,
      always_show_bufferline = false, -- | false,
      sort_by = 'id', -- ,'id' | 'extension' | 'relative_directory' | 'directory' | 'tabs' | function(buffer_a, buffer_b)
      --   -- add custom logic
      --   return buffer_a.modified > buffer_b.modified
      -- end
    },
    highlights = {
      fill = {
        bg = colors.bg,
      },
    },
  })

  local keymap = vim.keymap.set
  keymap('n', '<Tab>', '<CMD>BufferLineCycleNext<CR>', {})
  keymap('n', '<S-Tab>', '<CMD>BufferLineCyclePrev<CR>', {})
end

return M
