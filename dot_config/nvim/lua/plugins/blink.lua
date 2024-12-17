return {
  {
    "saghen/blink.cmp",
    enabled = false,
    opts = {
      sources = {
        min_keyword_length = 2,
      },
      fuzzy = {
        max_items = 20,
      },
      completion = {
        list = {
          max_items = 20,
        },
        menu = {
          auto_show = true,
        },
        accept = {
          create_undo_point = false,
        },
      },
    },
  },
}
