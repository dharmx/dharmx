local Awful = require("awful")

local enum = require("core.enum")
local MOD = enum.modifiers.MOD
local CTRL = enum.modifiers.CTRL

local mappings = {
  client = {
    {
      modifiers = MOD,
      key = "j",
      description = "Focus next by index",
      on_press = function() Awful.client.focus.byidx(1) end,
    },
    {
      modifiers = MOD,
      key = "k",
      on_press = function() Awful.client.focus.byidx(-1) end,
      description = "focus previous by index"
    },
    {
      modifiers = MOD,
      key = "Tab",
      description = "Go back.",
      on_press = function() Awful.client.focus.history.previous() if client.focus then client.focus:raise() end end,
    },
    {
      modifiers = MOD + CTRL,
      key = "n",
      description = "Restore minimized.",
      on_press = function()
        local client = Awful.client.restore()
        -- Focus restored client
        if client then client:activate({ raise = true, context = "key.unminimize" }) end
      end,
    }
  },
  screen = {
    {
      modifiers = MOD,
      key = "Return",
      description = "Focus the next screen.",
      on_press = function() Awful.screen.focus_relative(1) end,
    },
    {
      modifiers = MOD,
      key = "Return",
      description = "Focus the previous screen.",
      on_press = function() Awful.screen.focus_relative(-1) end,
    },
  },
}

return mappings
