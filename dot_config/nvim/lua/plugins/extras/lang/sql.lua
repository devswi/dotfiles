return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
        "sqlfluff",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "sql", "scss" } },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        sql = { "sqlfluff" },
      },
      linters = {
        sqlfluff = {
          command = "sqlfluff",
          args = { "lint", "-" },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        sql = { "sqlfluff" },
      },
      formatters = {
        sqlfluff = {
          command = "sqlfluff",
          args = { "fix", "-" },
          require_cwd = false,
        },
      },
    },
  },
}
