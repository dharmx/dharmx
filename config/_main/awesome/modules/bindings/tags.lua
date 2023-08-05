local Awful = require("awful")

local enum = require("core.enum")
local MOD = enum.modifiers.MOD

return {
  {
    modifiers = MOD,
    key = "[",
    description = "View previous.",
    on_press = Awful.tag.viewprev,
  },
  {
    modifiers = MOD,
    key = "]",
    description = "View next.",
    on_press = Awful.tag.viewnext,
  },
}
