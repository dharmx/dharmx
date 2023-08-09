local M = {}

local Awful = require("awful")
local Wibox = require("wibox")
local DPI = require("beautiful.xresources").apply_dpi

local std = require("core.std")
local enum = require("core.enum")
local EMPTY = enum.modifiers.EMPTY
local SUPER = enum.modifiers.SUPER

M.keyboardlayout = Awful.widget.keyboardlayout()
M.textclock = Wibox.widget.textclock()
M.promptbox = Awful.widget.prompt()

function M.layoutbox(local_screen)
  return Awful.widget.layoutbox({
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
end

function M.taglist(local_screen)
  return Awful.widget.taglist({
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
end

function M.tasklist(local_screen)
  return Awful.widget.tasklist({
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
end

function M.wibox(local_screen)
  return Awful.wibar({
    height = DPI(55),
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
end

return M
