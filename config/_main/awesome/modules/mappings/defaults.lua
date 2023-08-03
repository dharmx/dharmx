local Awful = require("awful")

local enum = require("core.enum")
local MOD = enum.modifiers.MOD
local SHIFT = enum.modifiers.SHIFT
local CTRL = enum.modifiers.CTRL

local mappings = {
  client = {
    {
      modifiers = MOD,
      key = "f",
      description = "Toggle fullscreen.",
      on_press = function(c)
        c.fullscreen = not c.fullscreen
        c:raise()
      end,
    },
    {
      modifiers = MOD + SHIFT,
      key = "c",
      description = "Close.",
      on_press = function(c) c:kill() end,
    },
    {
      modifiers = MOD + CTRL,
      key = "space",
      description = "Toggle floating.",
      on_press = Awful.client.floating.toggle,
    },
    {
      modifiers = MOD + CTRL,
      key = "Return",
      description = "Move to master.",
      on_press = function(c) c:swap(Awful.client.getmaster()) end,
    },
    {
      modifiers = MOD,
      key = "o",
      description = "Move to screen.",
      on_press = function(c) c:move_to_screen() end,
    },
    {
      modifiers = MOD,
      key = "t",
      description = "Toggle keep on top.",
      on_press = function(c) c.ontop = not c.ontop end,
    },
    {
      modifiers = MOD,
      key = "n",
      description = "Minimize.",
      on_press = function(c)
        -- The client currently has the input focus, so it cannot be
        -- minimized, since minimized clients can't have the focus.
        c.minimized = true
      end,
    },
    {
      modifiers = MOD,
      key = "m",
      description = "Maximize and unmaxmize.",
      on_press = function(c)
        c.maximized = not c.maximized
        c:raise()
      end,
    },
    {
      modifiers = MOD + CTRL,
      key = "m",
      description = "Unmaximize and maximize vertically.",
      on_press = function(c)
        c.maximized_vertical = not c.maximized_vertical
        c:raise()
      end,
    },
    {
      modifiers = MOD + SHIFT,
      key = "m",
      description = "Maximize and unmaximize horizontally.",
      on_press = function(c)
        c.maximized_horizontal = not c.maximized_horizontal
        c:raise()
      end,
    },
  },
}

return mappings
