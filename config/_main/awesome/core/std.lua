local M = {}

M.string = {}
M.table = {}

function M.table.map(f, t)
  local a = {}
  for _, v in ipairs(t) do table.insert(a, f(v)) end
  return a
end

function M.table.foreach(t, c)
  for k, v in pairs(t) do c(k, v) end
end

function M.table.foreachi(t, c)
  for i, v in ipairs(t) do c(i, v) end
end

function M.table.zip(...)
  local arrays, ans = { ... }, {}
  local index = 0
  return function()
    index = index + 1
    for i, t in ipairs(arrays) do
      if type(t) == "function" then
        ans[i] = t()
      else
        ans[i] = t[index]
      end
      if ans[i] == nil then return end
    end
    return table.unpack(ans)
  end
end

function M.table.keys(t)
  assert(type(t) == "table", string.format("Expected table, got %s", type(t)))
  local keys = {}
  for k, _ in pairs(t) do
    table.insert(keys, k)
  end
  return keys
end

function M.table.values(t)
  assert(type(t) == "table", string.format("Expected table, got %s", type(t)))
  local values = {}
  for _, v in pairs(t) do
    table.insert(values, v)
  end
  return values
end

function M.table.is_empty(t)
  assert(type(t) == "table", string.format("Expected table, got %s", type(t)))
  return next(t) == nil
end

---@private
local function can_merge(v) return type(v) == "table" and (M.table.is_empty(v) or not M.table.is_list(v)) end

local function table_extend(behavior, deep_extend, ...)
  if behavior ~= "error" and behavior ~= "keep" and behavior ~= "force" then
    error('invalid "behavior": ' .. tostring(behavior))
  end

  if select("#", ...) < 2 then
    error("wrong number of arguments (given " .. tostring(1 + select("#", ...)) .. ", expected at least 3)")
  end

  local ret = {}
  for i = 1, select("#", ...) do
    local t = select(i, ...)
    M.validate({ ["after the second argument"] = { t, "t" } })
    if t then
      for k, v in pairs(t) do
        if deep_extend and can_merge(v) and can_merge(ret[k]) then
          ret[k] = table_extend(behavior, true, ret[k], v)
        elseif behavior ~= "force" and ret[k] ~= nil then
          if behavior == "error" then error("key found in more than one map: " .. k) end -- Else behavior is "keep".
        else
          ret[k] = v
        end
      end
    end
  end
  return ret
end

function M.table.extend(behavior, ...) return table_extend(behavior, false, ...) end

function M.table.deep_extend(behavior, ...) return table_extend(behavior, true, ...) end

function M.table.deep_equal(a, b)
  if a == b then return true end
  if type(a) ~= type(b) then return false end
  if type(a) == "table" then
    for k, v in pairs(a) do
      if not M.table.deep_equal(v, b[k]) then return false end
    end
    for k, _ in pairs(b) do
      if a[k] == nil then return false end
    end
    return true
  end
  return false
end

function M.table.add_reverse_lookup(o)
  local keys = M.table.keys(o)
  for _, k in ipairs(keys) do
    local v = o[k]
    if o[v] then
      error(
        string.format(
          "The reverse lookup found an existing value for %q while processing key %q",
          tostring(v),
          tostring(k)
        )
      )
    end
    o[v] = k
  end
  return o
end

function M.table.get(o, ...)
  local keys = { ... }
  if #keys == 0 then return nil end
  for i, k in ipairs(keys) do
    o = o[k]
    if o == nil then
      return nil
    elseif type(o) ~= "table" and next(keys, i) then
      return nil
    end
  end
  return o
end

function M.table.list_extend(dst, src, start, finish)
  M.validate({
    dst = { dst, "t" },
    src = { src, "t" },
    start = { start, "n", true },
    finish = { finish, "n", true },
  })
  for i = start or 1, finish or #src do
    table.insert(dst, src[i])
  end
  return dst
end

function M.table.flatten(t)
  local result = {}
  local function _table_flatten(_t)
    local n = #_t
    for i = 1, n do
      local v = _t[i]
      if type(v) == "table" then
        _table_flatten(v)
      elseif v then
        table.insert(result, v)
      end
    end
  end
  _table_flatten(t)
  return result
end

function M.table.is_list(t)
  if type(t) ~= "table" then return false end

  local count = 0

  for k, _ in pairs(t) do
    if type(k) == "number" then
      count = count + 1
    else
      return false
    end
  end

  if count > 0 then return true end
  return false
end

function M.table.count(t)
  M.validate({ t = { t, "t" } })

  local count = 0
  for _ in pairs(t) do
    count = count + 1
  end
  return count
end

function M.table.slice(list, start, finish)
  local new_list = {}
  for i = start or 1, finish or #list do
    new_list[#new_list + 1] = list[i]
  end
  return new_list
end

function M.string.trim(s)
  M.validate({ s = { s, "s" } })
  return s:match("^%s*(.*%S)") or ""
end

do
  local type_names = {
    ["table"] = "table",
    t = "table",
    ["string"] = "string",
    s = "string",
    ["number"] = "number",
    n = "number",
    ["boolean"] = "boolean",
    b = "boolean",
    ["function"] = "function",
    f = "function",
    ["callable"] = "callable",
    c = "callable",
    ["nil"] = "nil",
    ["thread"] = "thread",
    ["userdata"] = "userdata",
  }

  local function _is_type(val, t) return type(val) == t or (t == "callable" and M.table.is_callable(val)) end

  ---@private
  local function is_valid(opt)
    if type(opt) ~= "table" then return false, string.format("opt: expected table, got %s", type(opt)) end

    for param_name, spec in pairs(opt) do
      if type(spec) ~= "table" then
        return false, string.format("opt[%s]: expected table, got %s", param_name, type(spec))
      end

      local val = spec[1] -- Argument value
      local types = spec[2] -- Type name, or callable
      local optional = (true == spec[3])

      if type(types) == "string" then types = { types } end

      if M.table.is_callable(types) then
        -- Check user-provided validation function
        local valid, optional_message = types(val)
        if not valid then
          local error_message = string.format("%s: expected %s, got %s", param_name, (spec[3] or "?"), tostring(val))
          if optional_message ~= nil then
            error_message = error_message .. string.format(". Info: %s", optional_message)
          end

          return false, error_message
        end
      elseif type(types) == "table" then
        local success = false
        for i, t in ipairs(types) do
          local t_name = type_names[t]
          if not t_name then return false, string.format("invalid type name: %s", t) end
          types[i] = t_name

          if (optional and val == nil) or _is_type(val, t_name) then
            success = true
            break
          end
        end
        if not success then
          return false, string.format("%s: expected %s, got %s", param_name, table.concat(types, "|"), type(val))
        end
      else
        return false, string.format("invalid type name: %s", tostring(types))
      end
    end

    return true, nil
  end

  function M.validate(opt)
    local ok, err_msg = is_valid(opt)
    if not ok then error(err_msg, 2) end
  end
end

function M.string.gsplit(s, sep, opts)
  local plain
  local trimempty = false
  if type(opts) == "boolean" then
    plain = opts -- For backwards compatibility.
  else
    M.validate({ s = { s, "s" }, sep = { sep, "s" }, opts = { opts, "t", true } })
    opts = opts or {}
    plain, trimempty = opts.plain, opts.trimempty
  end

  local start = 1
  local done = false

  -- For `trimempty`: queue of collected segments, to be emitted at next pass.
  local segs = {}
  local empty_start = true -- Only empty segments seen so far.

  local function _pass(i, j, ...)
    if i then
      assert(j + 1 > start, "Infinite loop detected")
      local seg = s:sub(start, i - 1)
      start = j + 1
      return seg, ...
    else
      done = true
      return s:sub(start)
    end
  end

  return function()
    if trimempty and #segs > 0 then
      -- trimempty: Pop the collected segments.
      return table.remove(segs)
    elseif done or (s == "" and sep == "") then
      return nil
    elseif sep == "" then
      if start == #s then done = true end
      return _pass(start + 1, start)
    end

    local seg = _pass(s:find(sep, start, plain))

    -- Trim empty segments from start/end.
    if trimempty and seg ~= "" then
      empty_start = false
    elseif trimempty and seg == "" then
      while not done and seg == "" do
        table.insert(segs, 1, "")
        seg = _pass(s:find(sep, start, plain))
      end
      if done and seg == "" then
        return nil
      elseif empty_start then
        empty_start = false
        segs = {}
        return seg
      end
      if seg ~= "" then table.insert(segs, 1, seg) end
      return table.remove(segs)
    end

    return seg
  end
end

function M.string.split(s, sep, opts)
  local t = {}
  for c in M.string.gsplit(s, sep, opts) do
    table.insert(t, c)
  end
  return t
end

function M.table.is_callable(f)
  if type(f) == "function" then return true end
  local m = getmetatable(f)
  if m == nil then return false end
  return type(m.__call) == "function"
end

function M.table.default_table(create)
  create = create or function(_) return M.table.default_table() end
  return setmetatable({}, {
    __index = function(t, k)
      rawset(t, k, create(k))
      return rawget(t, k)
    end,
  })
end

return M
