local M = {}

local Gears = require("gears")
local PosixStdlib = require("posix.stdlib")

local functional = require("core.functional")

M.modifiers = {
  ALT = { "Mod1" },
  CTRL = { "Control" },
  SHIFT = { "Shift" },
  SUPER = { "Mod4" },
  EMPTY = {},
}

for _, key in pairs(M.modifiers) do
  setmetatable(key, {
    __add = function(self, new_key)
      local copy = Gears.table.clone(self, true)
      table.insert(copy, new_key[1])
      return copy
    end,
  })
end

M.environ = setmetatable({}, {
  __index = function(self, key)
    local value = functional.if_nil(rawget(self, key), os.getenv(key))
    rawset(self, key, value)
    return value
  end,
  __newindex = function(self, key, value)
    rawset(self, key, value)
    PosixStdlib.setenv(key, value, true)
  end,
})

return M
