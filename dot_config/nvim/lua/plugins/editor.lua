return {
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
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({
        keymaps = {
          visual = "gs",
        },
      })
    end,
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    ft = { "markdown", "codecompanion", "Avante", "norg", "rmd", "org" },
    opts = {
      preview = {
        filetypes = { "markdown", "codecompanion", "norg", "rmd", "org", "Avante" },
        ignore_buftypes = {},
        modes = { "c", "n", "no", "i", "v" },
        hybrid_modes = { "i", "v" },
      },
      max_length = 99999,
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    ft = { "markdown", "codecompanion", "Avante", "norg", "rmd", "org" },
    opts = {
      file_types = { "markdown", "codecompanion", "norg", "rmd", "org", "Avante" },
    },
  },
}
