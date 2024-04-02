local M = {}

M.map = function(mode, lhs, rhs, opts)
    rhs = rhs or "<nop>"
    opts = opts or {}
    opts.silent = opts.silent ~= false
    vim.keymap.set(mode, lhs, rhs, opts)
end

M.del = function(modes, lhs, opts)
    vim.keymap.del(modes, lhs, opts)
end

---@param key LazyKeys
M.lazykey = function(key)
    local mode = key.mode or "n"
    local lhs = key[1]
    local rhs = key[2]
    local opts = {
        desc = key.desc,
        remap = key.remap,
        expr = key.expr,
    }

    M.map(mode, lhs, rhs, opts)
end

---@param keys LazyKeys[]
M.lazykeys = function(keys)
    for _, key in ipairs(keys) do
        M.lazykey(key)
    end
end

return M
