return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    build = ":Codeium Auth",
    config = function()
      vim.g.codeium_disable_bindings = 1
      vim.keymap.set("i", "<C-l>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },
}
