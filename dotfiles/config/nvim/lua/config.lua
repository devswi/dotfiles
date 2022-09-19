local servers = {
  jsonls = {
    format = true,
  },
  sumneko_lua = {
    format = true,
  },
  tsserver = {
    format = true, -- disable formatting all together
  },
  cssls = {
    format = false,
  },
  tailwindcss = {
    format = true,
  },
}

local user_servers = vim.tbl_keys(servers)

return {
  supported_themes = {
    'tokyonight',
    'catppuccin',
  },
  border = 'rounded',
  theme = 'tokyonight',
  lsp = {
    format_on_save = true, -- true/false or table of filetypes {'.ts', '.js',}
    rename_notification = true,
    can_client_format = function(client_name)
      if servers[client_name] == true then
        return true
      end
      if vim.tbl_contains(user_servers, client_name) and servers[client_name] then
        return servers[client_name].format
      end
      return true
    end,
    -- vim.diagnostic.config settiings
    servers = servers,
  },
}
