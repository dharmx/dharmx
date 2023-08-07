local Awful = require("awful")
local Wibox = require("wibox")

local std = require("core.std")
local config = require("core.config").get().modules.wibars
local enum = require("core.enum")
local EMPTY = enum.modifiers.EMPTY
local SUPER = enum.modifiers.SUPER

require("awful.autofocus")
mykeyboardlayout = Awful.widget.keyboardlayout()
mytextclock = Wibox.widget.textclock()

screen.connect_signal("request::desktop_decoration", function(local_screen)
  Awful.tag(config.tag, local_screen, Awful.layout.layouts[1])
  local_screen.mypromptbox = Awful.widget.prompt()

  local_screen.mylayoutbox = Awful.widget.layoutbox({
    screen = local_screen,
    buttons = std.table.map(Awful.button, {
      {
        modifiers = EMPTY,
        button = 1,
        on_press = function() Awful.layout.inc(1) end,
      },
      {
        modifiers = EMPTY,
        button = 3,
        on_press = function() Awful.layout.inc(-1) end,
      },
      {
        modifiers = EMPTY,
        button = 4,
        on_press = function() Awful.layout.inc(-1) end,
      },
      {
        modifiers = EMPTY,
        button = 5,
        on_press = function() Awful.layout.inc(1) end,
      },
    }),
  })

  local_screen.mytaglist = Awful.widget.taglist({
    screen = local_screen,
    filter = Awful.widget.taglist.filter.all,
    buttons = std.table.map(Awful.button, {
      {
        modifiers = EMPTY,
        button = 1,
        on_press = function(local_tag) local_tag:view_only() end,
      },
      {
        modifiers = SUPER,
        button = 1,
        on_press = function(local_tag) if client.focus then client.focus:move_to_tag(local_tag) end end,
      },
      {
        modifiers = EMPTY,
        button = 3,
        on_press = Awful.tag.viewtoggle,
      },
      {
        modifiers = SUPER,
        button = 3,
        on_press = function(local_tag) if client.focus then client.focus:toggle_tag(local_tag) end end,
      },
      {
        modifiers = EMPTY,
        button = 4,
        on_press = function(local_tag) Awful.tag.viewprev(local_tag.screen) end,
      },
      {
        modifiers = EMPTY,
        button = 5,
        on_press = function(local_tag) Awful.tag.viewnext(local_tag.screen) end,
      },
    }),
  })

  local_screen.mytasklist = Awful.widget.tasklist({
    screen = local_screen,
    filter = Awful.widget.tasklist.filter.currenttags,
    buttons = std.table.map(Awful.button, {
      {
        modifiers = EMPTY,
        button = 1,
        on_press = function(node) node:activate({ context = "tasklist", action = "toggle_minimization" }) end,
      },
      {
        modifiers = EMPTY,
        button = 3,
        on_press = function() Awful.menu.client_list({ theme = { width = 250 } }) end,
      },
      {
        modifiers = EMPTY,
        button = 4,
        on_press = function() Awful.client.focus.byidx(-1) end,
      },
      {
        modifiers = EMPTY,
        button = 5,
        on_press = function() Awful.client.focus.byidx(1) end,
      },
    }),
  })

  local_screen.mywibox = Awful.wibar({
    position = "top",
    screen = local_screen,
    widget = {
      layout = Wibox.layout.align.horizontal,
      { -- Left widgets
        layout = Wibox.layout.fixed.horizontal,
        mylauncher,
        local_screen.mytaglist,
        local_screen.mypromptbox,
      },
      local_screen.mytasklist, -- Middle widget
      { -- Right widgets
        layout = Wibox.layout.fixed.horizontal,
        mykeyboardlayout,
        Wibox.widget.systray(),
        mytextclock,
        local_screen.mylayoutbox,
      },
    },
  })
end)
