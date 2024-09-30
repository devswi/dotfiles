return {
  {
    "numToStr/Comment.nvim",
    event = { "VeryLazy" },
    keys = {
      {
        "gb",
        "<Plug>(comment_toggle_blockwise_visual)",
        desc = "Toggle comment blockwise",
        mode = { "x" },
      },
    },
    opts = {
      ignore = "^$",
    },
    config = function(_, opts)
      opts.pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      require("Comment").setup(opts)
    end,
    dependencies = {
      {
        "JoosepAlviste/nvim-ts-context-commentstring",
        lazy = true,
        event = { "VeryLazy" },
        init = function()
          vim.g.skip_ts_context_commentstring_module = true
        end,
        opts = {},
      },
    },
  },
}
