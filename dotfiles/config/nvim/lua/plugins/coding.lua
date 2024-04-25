-- cSpell:disable
return {
  { import = "plugins.extras.coding.autopairs" },
  { import = "plugins.extras.coding.comment" },
  { import = "plugins.extras.coding.load-vscode-snippets" },
  { import = "lazyvim.plugins.extras.test.core" },
  {
    "echasnovski/mini.surround",
    enabled = false,
  },
  {
    "kylechui/nvim-surround",
    vscode = true,
    config = function()
      require("nvim-surround").setup()
    end,
  },
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    vscode = false,
    config = function()
      -- disable codeium
      vim.g.codeium_disable_bindings = 1

      -- reset codeium
      vim.keymap.set("i", "<C-a>", function()
        return vim.fn["codeium#Accept"]()
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-]>", function()
        return vim.fn["codeium#CycleCompletions"](1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-[>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
      end, { expr = true, silent = true })
      vim.keymap.set("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
      end, { expr = true, silent = true })
    end,
  },
  {
    "folke/flash.nvim",
    keys = {
      {
        "S",
        mode = { "n", "o", "x" },
        false,
      },
    },
  },
}
