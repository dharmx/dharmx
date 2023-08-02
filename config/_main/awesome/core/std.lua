local M = {}

function M.deepcopy(orig, copies)
  copies = copies or {}
  local orig_type = type(orig)
  local copy
  if orig_type == "table" then
    if copies[orig] then
      copy = copies[orig]
    else
      copy = {}
      copies[orig] = copy
      for orig_key, orig_value in next, orig, nil do
        copy[M.deepcopy(orig_key, copies)] = M.deepcopy(orig_value, copies)
      end
      setmetatable(copy, M.deepcopy(getmetatable(orig), copies))
    end
  else -- number, string, boolean, etc
    copy = orig
  end
  return copy
end

function M.tbl_sum(t)
  assert(M.tbl_islist(t), "Expected a array got a dict instead")
  local s = 0
  for _, n in ipairs(t) do s = s + n end
  return s
end

function M.tbl_keys(t)
  assert(type(t) == "table", string.format("Expected table, got %s", type(t)))

  local keys = {}
  for k, _ in pairs(t) do
    table.insert(keys, k)
  end
  return keys
end

function M.tbl_values(t)
  assert(type(t) == "table", string.format("Expected table, got %s", type(t)))

  local values = {}
  for _, v in pairs(t) do
    table.insert(values, v)
  end
  return values
end

function M.tbl_map(func, t)
  M.validate({ func = { func, "c" }, t = { t, "t" } })

  local rettab = {}
  for k, v in pairs(t) do
    rettab[k] = func(v)
  end
  return rettab
end

function M.tbl_filter(func, t)
  M.validate({ func = { func, "c" }, t = { t, "t" } })

  local rettab = {}
  for _, entry in pairs(t) do
    if func(entry) then table.insert(rettab, entry) end
  end
  return rettab
end

function M.tbl_contains(t, value)
  M.validate({ t = { t, "t" } })

  for _, v in ipairs(t) do
    if v == value then return true end
  end
  return false
end

function M.tbl_isempty(t)
  assert(type(t) == "table", string.format("Expected table, got %s", type(t)))
  return next(t) == nil
end

---@private
local function can_merge(v) return type(v) == "table" and (M.tbl_isempty(v) or not M.tbl_islist(v)) end

local function tbl_extend(behavior, deep_extend, ...)
  if behavior ~= "error" and behavior ~= "keep" and behavior ~= "force" then
    error('invalid "behavior": ' .. tostring(behavior))
  end

  if select("#", ...) < 2 then
    error("wrong number of arguments (given " .. tostring(1 + select("#", ...)) .. ", expected at least 3)")
  end

  local ret = {}
  if M._empty_dict_mt ~= nil and getmetatable(select(1, ...)) == M._empty_dict_mt then ret = M.empty_dict() end

  for i = 1, select("#", ...) do
    local tbl = select(i, ...)
    M.validate({ ["after the second argument"] = { tbl, "t" } })
    if tbl then
      for k, v in pairs(tbl) do
        if deep_extend and can_merge(v) and can_merge(ret[k]) then
          ret[k] = tbl_extend(behavior, true, ret[k], v)
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

function M.tbl_extend(behavior, ...) return tbl_extend(behavior, false, ...) end

function M.tbl_deep_extend(behavior, ...) return tbl_extend(behavior, true, ...) end

function M.deep_equal(a, b)
  if a == b then return true end
  if type(a) ~= type(b) then return false end
  if type(a) == "table" then
    for k, v in pairs(a) do
      if not M.deep_equal(v, b[k]) then return false end
    end
    for k, _ in pairs(b) do
      if a[k] == nil then return false end
    end
    return true
  end
  return false
end

function M.tbl_add_reverse_lookup(o)
  local keys = M.tbl_keys(o)
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

function M.tbl_get(o, ...)
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

function M.list_extend(dst, src, start, finish)
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

function M.tbl_flatten(t)
  local result = {}
  local function _tbl_flatten(_t)
    local n = #_t
    for i = 1, n do
      local v = _t[i]
      if type(v) == "table" then
        _tbl_flatten(v)
      elseif v then
        table.insert(result, v)
      end
    end
  end
  _tbl_flatten(t)
  return result
end

function M.tbl_islist(t)
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
  return getmetatable(t) ~= M._empty_dict_mt
end

function M.tbl_count(t)
  M.validate({ t = { t, "t" } })

  local count = 0
  for _ in pairs(t) do
    count = count + 1
  end
  return count
end

function M.list_slice(list, start, finish)
  local new_list = {}
  for i = start or 1, finish or #list do
    new_list[#new_list + 1] = list[i]
  end
  return new_list
end

function M.trim(s)
  M.validate({ s = { s, "s" } })
  return s:match("^%s*(.*%S)") or ""
end

function M.startswith(s, prefix)
  M.validate({ s = { s, "s" }, prefix = { prefix, "s" } })
  return s:sub(1, #prefix) == prefix
end

function M.endswith(s, suffix)
  M.validate({ s = { s, "s" }, suffix = { suffix, "s" } })
  return #suffix == 0 or s:sub(-#suffix) == suffix
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

  local function _is_type(val, t) return type(val) == t or (t == "callable" and M.is_callable(val)) end

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

      if M.is_callable(types) then
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

function M.split(s, sep, opts)
  local t = {}
  for c in M.gsplit(s, sep, opts) do
    table.insert(t, c)
  end
  return t
end
function M.is_callable(f)
  if type(f) == "function" then return true end
  local m = getmetatable(f)
  if m == nil then return false end
  return type(m.__call) == "function"
end

function M.defaulttable(create)
  create = create or function(_) return M.defaulttable() end
  return setmetatable({}, {
    __index = function(tbl, key)
      rawset(tbl, key, create(key))
      return rawget(tbl, key)
    end,
  })
end

return M
