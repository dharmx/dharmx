local Awful = require("awful")

local enum = require("core.enum")
local SUPER = enum.modifiers.SUPER
local SHIFT = enum.modifiers.SHIFT
local CTRL = enum.modifiers.CTRL
local ALT = enum.modifiers.ALT

return {
  {
    modifiers = SUPER,
    key = "q",
    description = "Close.",
    on_press = function(node) node:kill() end,
  },
  {
    modifiers = SUPER + SHIFT,
    key = "q",
    description = "Kill.",
    on_press = function(node) awesome.kill(node.pid, 9) end,
  },
  {
    modifiers = SUPER,
    key = "f",
    description = "Toggle fullscreen.",
    on_press = function(node)
      node.fullscreen = not node.fullscreen
      node:raise()
    end,
  },
  {
    modifiers = SUPER,
    key = "s",
    description = "Toggle floating.",
    on_press = Awful.client.floating.toggle,
  },
  {
    modifiers = SUPER + CTRL,
    key = "Return",
    description = "Move to master.",
    on_press = function(node) node:swap(Awful.client.getmaster()) end,
  },
  {
    modifiers = SUPER,
    key = "o",
    description = "Move to screen.",
    on_press = function(node) node:move_to_screen() end,
  },
  {
    modifiers = SUPER + ALT,
    key = "m",
    description = "Minimize.",
    on_press = function(node) node.minimized = true end,
  },
  {
    modifiers = SUPER,
    key = "m",
    description = "Maximize and unmaxmize.",
    on_press = function(node)
      node.maximized = not node.maximized
      node:raise()
    end,
  },
}
