return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      css = { "prettier", "eslint" },
      scss = { "prettier", "eslint" },
      json = { "prettier", "eslint" },
      jsonc = { "prettier", "eslint" },
      html = { "prettier", "eslint" },
      go = {
        "goimports",
        "gofumpt",
      },
    },
    lang_to_ext = {
      vue = "vue",
    },
    formatters = {
      prettier = {
        prepend_args = { "--single-quote" },
        require_cwd = true,
        cwd = require("conform.util").root_file({
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.yml",
          ".prettierrc.yaml",
          ".prettierrc.json5",
          ".prettierrc.js",
          ".prettierrc.cjs",
          ".prettierrc.mjs",
          ".prettierrc.toml",
          "prettier.config.js",
          "prettier.config.cjs",
          "prettier.config.mjs",
        }),
      },
    },
  },
}
