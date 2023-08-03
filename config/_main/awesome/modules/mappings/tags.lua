local Awful = require("awful")

local enum = require("core.enum")
local MOD = enum.modifiers.MOD

local mappings = {
  tag = {
    {
      modifiers = MOD,
      key = "Left",
      description = "View previous.",
      on_press = Awful.tag.viewprev,
    },
    {
      modifiers = MOD,
      key = "Right",
      description = "View next.",
      on_press = Awful.tag.viewnext,
    },
    {
      modifiers = MOD,
      key = "Escape",
      description = "Go back.",
      on_press = Awful.tag.history.restore,
    },
  }
}

return mappings
