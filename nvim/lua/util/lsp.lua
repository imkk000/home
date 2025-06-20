local M = {}

function M.has(buffer, method)
  method = method:find("/") and method or "textDocument/" .. method
  local clients = vim.lsp.get_clients({ bufnr = buffer })
  for _, client in ipairs(clients) do
    if client.supports_method(method) then
      return true
    end
  end
  return false
end

function M.map(opts, has, modes, lhs, rhs, desc)
  local bufnr = opts.buffer or 0
  if has and not M.has(bufnr, has) then
    return
  end

  opts.desc = " " .. desc
  vim.keymap.set(modes, lhs, rhs, opts)
end

function M.format(args)
  vim.lsp.buf.format({ timeout_ms = 10000, async = false, bufnr = args.buf })
end

return M
