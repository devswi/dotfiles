return {
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
    opts = {
      provider = "copilot",
      --- @class AvanteFileSelectorConfig
      file_selector = {
        --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string
        provider = "snacks",
        -- Options override for custom providers
        provider_opts = {},
      },
      windows = {
        sidebar_header = {
          enabled = false, -- true, false to enable/disable the header
          align = "center", -- left, center, right for title
          rounded = true,
        },
      },
    },
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        keymap = {
          next = "<M-]>",
          prev = "<M-[>",
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        help = true,
      },
    },
  },
}
