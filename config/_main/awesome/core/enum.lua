local M = {}
local Gears = require("gears")

M.modifiers = {
  MOD = { modkey },
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

return M
