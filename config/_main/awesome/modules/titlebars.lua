local std = require("core.std")
local enum = require("core.enum")
local EMPTY = enum.modifiers.EMPTY

local Awful = require("awful")
local Wibox = require("wibox")
local Beautiful = require("beautiful")

local DPI = Beautiful.xresources.apply_dpi
require("awful.autofocus")

client.connect_signal("request::titlebars", function(node)
  local buttons = std.table.map(Awful.button, {
    {
      modifiers = EMPTY,
      button = 1,
      on_press = function() node:activate({ context = "titlebar", action = "mouse_move" }) end,
    },
    {
      modifiers = EMPTY,
      button = 3,
      on_press = function() node:activate({ context = "titlebar", action = "mouse_resize" }) end,
    },
  })

  Awful.titlebar(node, { position = "top", size = Beautiful.titlebar_height }).widget = {
    {
      {
        Awful.titlebar.widget.iconwidget(node),
        margins = { top = DPI(10), bottom = DPI(10), left = DPI(10), right = DPI(0) },
        widget = Wibox.container.margin,
      },
      buttons = buttons,
      layout = Wibox.layout.fixed.horizontal,
    },
    { -- Middle
      { -- Title
        halign = "center",
        widget = Awful.titlebar.widget.titlewidget(node),
      },
      buttons = buttons,
      layout = Wibox.layout.flex.horizontal,
    },
    {
      {
        Awful.titlebar.widget.minimizebutton(node),
        margins = { top = DPI(10), bottom = DPI(10), left = DPI(1), right = DPI(2) },
        widget = Wibox.container.margin,
      },
      {
        Awful.titlebar.widget.maximizedbutton(node),
        margins = { top = DPI(10), bottom = DPI(10), left = DPI(1), right = DPI(2) },
        widget = Wibox.container.margin,
      },
      {
        Awful.titlebar.widget.closebutton(node),
        margins = { top = DPI(9), bottom = DPI(9), left = DPI(0), right = DPI(5) },
        widget = Wibox.container.margin,
      },
      layout = Wibox.layout.fixed.horizontal(),
      top = DPI(2),
      bottom = DPI(2),
      left = DPI(8),
    },
    layout = Wibox.layout.align.horizontal,
  }
end)
