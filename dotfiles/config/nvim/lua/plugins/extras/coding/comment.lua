-- cspell:disable
return {
  { "echasnovski/mini.comment", cond = vim.g.vscode },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    event = { "VeryLazy" },
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
    opts = {},
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = { "VeryLazy" },
    opts = function(_, opts)
      opts.ignore = "^$"
      opts.pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
    end,
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
  },
}
