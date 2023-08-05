local Awful = require("awful")

local enum = require("core.enum")
local MOD = enum.modifiers.MOD
local SHIFT = enum.modifiers.SHIFT

return {
  {
    modifiers = MOD + SHIFT,
    key = "j",
    on_press = function() Awful.client.swap.byidx(1) end,
    description = "Swap with next client by index.",
  },
  {
    modifiers = MOD + SHIFT,
    key = "k",
    on_press = function() Awful.client.swap.byidx(-1) end,
    description = "Swap with previous client by index.",
  },
  {
    modifiers = MOD,
    key = "u",
    on_press = Awful.client.urgent.jumpto,
    description = "Jump to urgent client.",
  },
}
