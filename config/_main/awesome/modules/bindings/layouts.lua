local Awful = require("awful")

local enum = require("core.enum")
local SUPER = enum.modifiers.SUPER
local SHIFT = enum.modifiers.SHIFT
local CTRL = enum.modifiers.CTRL

return {
  {
    modifiers = SUPER,
    key = "l",
    on_press = function() Awful.tag.incmwfact(0.05) end,
    description = "Increase master width factor.",
  },
  {
    modifiers = SUPER,
    key = "h",
    on_press = function() Awful.tag.incmwfact(-0.05) end,
    description = "Decrease master width factor."
  },
  {
    modifiers = SUPER + SHIFT,
    key = "h",
    on_press = function() Awful.tag.incnmaster(1, nil, true) end,
    description = "Increase the number of master clients.",
  },
  {
    modifiers = SUPER + SHIFT,
    key = "l",
    on_press = function() Awful.tag.incnmaster(-1, nil, true) end,
    description = "Decrease the number of master clients.",
  },
  {
    modifiers = SUPER + CTRL,
    key = "h",
    on_press = function() Awful.tag.incncol(1, nil, true) end,
    description = "Increase the number of columns.",
  },
  {
    modifiers = SUPER + CTRL,
    key = "l",
    on_press = function() Awful.tag.incncol(-1, nil, true) end,
    description = "Decrease the number of columns.",
  },
  {
    modifiers = SUPER + SHIFT,
    key = "space",
    on_press = function() Awful.layout.inc(-1) end,
    description = "Select previous.",
  },
}
