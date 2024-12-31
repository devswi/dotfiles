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
        ["*"] = { "cspell" },
      },
    },
  },
}
