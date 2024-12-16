return {
  { import = "plugins.extras.coding.autopairs" },
  { import = "plugins.extras.coding.comment" },
  { import = "lazyvim.plugins.extras.coding.luasnip" },
  { import = "plugins.extras.linting.nvim-lint" },
  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },
}
