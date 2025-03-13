return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
        "cspell",
      },
    },
  },
  {
    "nvim-lint",
    opts = {
      linters_by_ft = {
        go = { "cspell" },
        vue = { "cspell" },
        lua = { "cspell" },
        markdown = { "cspell" },
        typescript = { "cspell" },
        typescriptreact = { "cspell" },
        javascript = { "cspell" },
        javascriptreact = { "cspell" },
        css = { "cspell" },
      },
    },
  },
}
