return setmetatable({}, {
  __index = function(_, key)
    return require("core." .. key)
  end,
})
