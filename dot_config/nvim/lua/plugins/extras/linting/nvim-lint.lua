return {
  {
    "nvim-lint",
    opts = {
      linters_by_ft = {
        ["*"] = { "cspell" },
      },
      linters = {
        markdownlint = {
          args = { "--disable", "MD013", "MD033", "--" },
        },
      },
    },
  },
}
