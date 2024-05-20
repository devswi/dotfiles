-- cSpell:disable
-- https://www.lazyvim.org/plugins/lsp#nvim-lspconfig

vim.lsp.set_log_level(vim.log.levels.OFF)

local vscode = require("util.vscode")

vim.g.autoformat = vscode.get_setting("editor.formatOnSave")

return {
  { import = "plugins.extras.lang.vue" },
  { import = "plugins.extras.lang.typescript" },
  { import = "plugins.extras.lang.rust" },
  { import = "plugins.extras.linting.eslint" },
  { import = "plugins.extras.formatting.prettier" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        underline = true,
        virtual_text = {
          ource = false,
        },
      },
    },
  },
  -- lsp settings
  {
    "tamago324/nlsp-settings.nvim",
    cmd = "LspSettings",
    opts = {},
  },
}
