return {
  {
    "mason.nvim",
    opts = {
      ensure_installed = {
        "harper-ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        harper_ls = {
          filetypes = {
            "markdown",
            "rust",
            "typescript",
            "typescriptreact",
            "javascript",
            "python",
            "go",
            "c",
            "cpp",
            "ruby",
            "swift",
            "cs",
            "toml",
            "lua",
            "gitcommit",
            "java",
            "html",
            "vue",
          },
          settings = {
            ["harper-ls"] = {
              userDictPath = "~/.config/harper-ls/dict.txt",
              linters = {
                spell_check = true,
                spelled_numbers = false,
                an_a = true,
                sentence_capitalization = false,
                unclosed_quotes = true,
                wrong_quotes = false,
                long_sentences = true,
                repeated_words = true,
                spaces = true,
                matcher = true,
                correct_number_suffix = true,
                number_suffix_capitalization = true,
                multiple_sequential_pronouns = true,
                linking_verbs = false,
                avoid_curses = true,
                terminating_conjunctions = true,
              },
              codeActions = {
                forceStable = true,
              },
            },
          },
        },
      },
    },
  },
}
