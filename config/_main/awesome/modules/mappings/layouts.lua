local Awful = require("awful")

local enum = require("core.enum")
local MOD = enum.modifiers.MOD
local SHIFT = enum.modifiers.SHIFT
local CTRL = enum.modifiers.CTRL

local mappings = {
  client = {
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
  },
  layout = {
    {
      modifiers = MOD,
      key = "l",
      on_press = function() Awful.tag.incmwfact(0.05) end,
      description = "Increase master width factor.",
    },
    {
      modifiers = MOD,
      key = "h",
      on_press = function() Awful.tag.incmwfact(-0.05) end,
      description = "Decrease master width factor."
    },
    {
      modifiers = MOD + SHIFT,
      key = "h",
      on_press = function() Awful.tag.incnmaster(1, nil, true) end,
      description = "Increase the number of master clients.",
    },
    {
      modifiers = MOD + SHIFT,
      key = "l",
      on_press = function() Awful.tag.incnmaster(-1, nil, true) end,
      description = "Decrease the number of master clients.",
    },
    {
      modifiers = MOD + CTRL,
      key = "h",
      on_press = function() Awful.tag.incncol(1, nil, true) end,
      description = "Increase the number of columns.",
    },
    {
      modifiers = MOD + CTRL,
      key = "l",
      on_press = function() Awful.tag.incncol(-1, nil, true) end,
      description = "Decrease the number of columns.",
    },
    {
      modifiers = MOD + SHIFT,
      key = "space",
      on_press = function() Awful.layout.inc(-1) end,
      description = "Select previous.",
    },
    {
      modifiers = MOD,
      key = "space",
      on_press = function() Awful.layout.inc(1) end,
      description = "Select next.",
    }
  },
}

return mappings
