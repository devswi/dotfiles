local function filter(arr, fn)
  if type(arr) ~= 'table' then
    return arr
  end

  local filtered = {}
  for k, v in pairs(arr) do
    if fn(v, k, arr) then
      table.insert(filtered, v)
    end
  end

  return filtered
end

local function filterReactDTS(value)
  local uri = value.uri
  if uri == nil then
    uri = value.targetUri
  end
  return string.match(uri, '%.d.ts') == nil
end

---@diagnostic disable-next-line: unused-function, unused-local
local function file_exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local handlers = {
  ['textDocument/definition'] = function(err, result, method, ...)
    if vim.tbl_islist(result) and #result > 1 then
      local filtered_result = filter(result, filterReactDTS)
      return vim.lsp.handlers['textDocument/definition'](err, filtered_result, method, ...)
    end
    vim.lsp.handlers['textDocument/definition'](err, result, method, ...)
  end,
}

return {
  setup = function(_, capabilities, on_attach)
    require('typescript').setup({
      disable_commands = false,
      debug = false,
      server = {
        on_attach = on_attach,
        capabilities = capabilities,
        handlers = handlers,
        flags = {
          debounce_text_changes = 150,
        },
      },
    })
  end,
}
