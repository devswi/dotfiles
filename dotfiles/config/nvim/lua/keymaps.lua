local M = {}

M.generals = {
    { "<c-a>",      "gg<S-v>G", mode = { "n" } },
    { "+",          "<c-a>",    mode = { "n" } },
    { "-",          "<c-x>",    mode = { "n" } },

    -- reset float term
    { "<leader>ft", false },
    { "<leader>fT", false },
    { "<c-/>",      false,      mode = { "n", "t" } },
}

return M
