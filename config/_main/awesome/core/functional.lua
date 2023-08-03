local M = {}

function M.mute() end

function M.if_nil(a, b)
  if a == nil then return b end
  return a
end

function M.ok_or_nil(status, ...)
  if not status then return end
  return ...
end

function M.npcall(fn, ...) return M.ok_or_nil(pcall(fn, ...)) end

function M.nil_wrap(fn)
  return function(...) return M.npcall(fn, ...) end
end

function M.pack_len(...) return { n = select("#", ...), ... } end

function M.unpack_len(t) return table.unpack(t, 1, t.n) end

return M
