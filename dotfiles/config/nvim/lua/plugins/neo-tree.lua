return {
  'nvim-neo-tree/neo-tree.nvim',
  opts = {
    close_if_last_window = true,
    enable_diagnostics = false,
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = {
        enabled = true,
      },
    },
    default_component_configs = {
      icon = {
        folder_empty = '󰜌',
        folder_empty_open = '󰜌',
      },
      git_status = {
        symbols = {
          renamed = '󰁕',
          unstaged = '󰄱',
        },
      },
    },
    document_symbols = {
      kinds = {
        File = { icon = '󰈙', hl = 'Tag' },
        Namespace = { icon = '󰌗', hl = 'Include' },
        Package = { icon = '󰏖', hl = 'Label' },
        Class = { icon = '󰌗', hl = 'Include' },
        Property = { icon = '󰆧', hl = '@property' },
        Enum = { icon = '󰒻', hl = '@number' },
        Function = { icon = '󰊕', hl = 'Function' },
        String = { icon = '󰀬', hl = 'String' },
        Number = { icon = '󰎠', hl = 'Number' },
        Array = { icon = '󰅪', hl = 'Type' },
        Object = { icon = '󰅩', hl = 'Type' },
        Key = { icon = '󰌋', hl = '' },
        Struct = { icon = '󰌗', hl = 'Type' },
        Operator = { icon = '󰆕', hl = 'Operator' },
        TypeParameter = { icon = '󰊄', hl = 'Type' },
        StaticMethod = { icon = '󰠄 ', hl = 'Function' },
      },
    },
  },
}
