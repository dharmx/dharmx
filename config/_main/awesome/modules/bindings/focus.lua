local Awful = require("awful")

local enum = require("core.enum")
local MOD = enum.modifiers.MOD
local CTRL = enum.modifiers.CTRL

return {
  {
    modifiers = MOD,
    key = "j",
    description = "Focus next by index.",
    on_press = function() Awful.client.focus.byidx(1) end,
  },
  {
    modifiers = MOD,
    key = "k",
    on_press = function() Awful.client.focus.byidx(-1) end,
    description = "Focus previous by index."
  },
  {
    modifiers = MOD,
    key = "`",
    description = "Go back.",
    on_press = function()
      Awful.client.focus.history.previous()
      if client.focus then client.focus:raise() end
    end,
  },
  {
    modifiers = MOD + CTRL,
    key = "n",
    description = "Restore minimized.",
    on_press = function()
      local client = Awful.client.restore()
      if client then client:activate({ raise = true, context = "key.unminimize" }) end
    end,
  }
}
