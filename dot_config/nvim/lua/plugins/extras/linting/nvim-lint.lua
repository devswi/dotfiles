return {
  {
    "nvim-lint",
    opts = {
      linters = {
        markdownlint = {
          args = { "--disable", "MD013", "MD033", "--" },
        },
      },
    },
  },
}
