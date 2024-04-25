return {
  { import = "lazyvim.plugins.extras.ui.edgy" },
  { import = "lazyvim.plugins.extras.editor.outline" },
  {
    "edgy.nvim",
    opts = {
      animate = {
        enabled = false,
      },
      keys = {
        q = function(win)
          win.view.edgebar:close()
        end,
        Q = function(win)
          win:close()
        end,
      },
    },
  },
}
