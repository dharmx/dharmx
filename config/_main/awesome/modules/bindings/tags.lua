local Awful = require("awful")

local enum = require("core.enum")
local SUPER = enum.modifiers.SUPER

return {
  {
    modifiers = SUPER,
    key = "[",
    description = "View previous.",
    on_press = Awful.tag.viewprev,
  },
  {
    modifiers = SUPER,
    key = "]",
    description = "View next.",
    on_press = Awful.tag.viewnext,
  },
}
