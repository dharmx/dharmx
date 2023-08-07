local Awful = require("awful")

local enum = require("core.enum")
local SUPER = enum.modifiers.SUPER
local CTRL = enum.modifiers.CTRL

return {
  {
    modifiers = SUPER,
    key = "j",
    description = "Focus next by index.",
    on_press = function() Awful.client.focus.byidx(1) end,
  },
  {
    modifiers = SUPER,
    key = "k",
    on_press = function() Awful.client.focus.byidx(-1) end,
    description = "Focus previous by index."
  },
  {
    modifiers = SUPER,
    key = "`",
    description = "Go back.",
    on_press = function()
      Awful.client.focus.history.previous()
      if client.focus then client.focus:raise() end
    end,
  },
  {
    modifiers = SUPER + CTRL,
    key = "n",
    description = "Restore minimized.",
    on_press = function()
      local client = Awful.client.restore()
      if client then client:activate({ raise = true, context = "key.unminimize" }) end
    end,
  }
}
