-- cSpell:disable
return {
  {
    import = "plugins.extras.coding.fold",
  },
  {
    "NvChad/nvim-colorizer.lua",
    opts = {
      user_default_options = {
        tailwind = true,
        RGB = true, -- #RGB hex codes
        RRGGBB = true, -- #RRGGBB hex codes
        names = false, -- "Name" codes like Blue or blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        AARRGGBB = true, -- 0xAARRGGBB hex codes
        rgb_fn = true, -- CSS rgb() and rgba() functions
        hsl_fn = true, -- CSS hsl() and hsla() functions
        css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
        css_fn = true,
      },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    event = "BufRead",
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "diff",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "vim",
        "vimdoc",
        "yaml",
        "css",
        "dockerfile",
        "prisma",
        "json5",
        "go",
        "pug",
        "ruby",
        "scss",
        "dart",
        "typescript",
        "rust",
        "vue",
        "svelte",
      },
    },
  },
  {
    "folke/zen-mode.nvim",
    cmd = { "ZenMode" },
    keys = {
      { "<leader>wo", ":ZenMode<cr>", desc = "Zen Mode" },
    },
    opts = {
      window = {
        width = 0.75,
        options = {
          number = false,
        },
      },
      plugins = {
        gitsigns = {
          enabled = true, -- true to disable...
        },
      },
    },
  },
}
