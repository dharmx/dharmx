local M = {}

local Awful = require("awful")
local Wibox = require("wibox")
local Beautiful = require("beautiful")
local DPI = Beautiful.xresources.apply_dpi

local std = require("core.std")
local enum = require("core.enum")
local EMPTY = enum.modifiers.EMPTY

M.buttons = std.table.map(Awful.button, {
  {
    modifiers = EMPTY,
    button = 1,
    on_press = function(node) node:activate({ context = "titlebar", action = "mouse_move" }) end,
  },
  {
    modifiers = EMPTY,
    button = 3,
    on_press = function(node) node:activate({ context = "titlebar", action = "mouse_resize" }) end,
  },
})

function M.initialize(node)
  return {
    {
      {
        Awful.titlebar.widget.iconwidget(node),
        margins = { top = DPI(14), bottom = DPI(14), left = DPI(13), right = DPI(1) },
        widget = Wibox.container.margin,
      },
      {
        Awful.titlebar.widget.titlewidget(node),
        margins = { top = DPI(10), bottom = DPI(10), left = DPI(5), right = DPI(0) },
        widget = Wibox.container.margin,
      },
      buttons = M.buttons,
      layout = Wibox.layout.fixed.horizontal,
    },
    {
      buttons = M.buttons,
      layout = Wibox.layout.flex.horizontal,
    },
    {
      {
        Awful.titlebar.widget.minimizebutton(node),
        margins = { top = DPI(14), bottom = DPI(14), left = DPI(5), right = DPI(2) },
        widget = Wibox.container.margin,
      },
      {
        Awful.titlebar.widget.maximizedbutton(node),
        margins = { top = DPI(14), bottom = DPI(14), left = DPI(5), right = DPI(2) },
        widget = Wibox.container.margin,
      },
      {
        Awful.titlebar.widget.closebutton(node),
        margins = { top = DPI(14), bottom = DPI(14), left = DPI(5), right = DPI(13) },
        widget = Wibox.container.margin,
      },
      layout = Wibox.layout.fixed.horizontal,
    },
    layout = Wibox.layout.align.horizontal,
  }
end

return M
