local Awful = require("awful")

local enum = require("core.enum")
local SUPER = enum.modifiers.SUPER
local CTRL = enum.modifiers.CTRL
local SHIFT = enum.modifiers.SHIFT

local NUMROW = Awful.key.keygroup.NUMROW
local NUMPAD = Awful.key.keygroup.NUMPAD

return {
  tag = {
    {
      modifiers = SUPER,
      keygroup = NUMROW,
      description = "Only view tag.",
      on_press = function(index)
        local screen = Awful.screen.focused()
        if not screen then return end
        local tag = screen.tags[index]
        if tag then tag:view_only() end
      end,
    },
    {
      modifiers = SUPER + CTRL,
      keygroup = NUMROW,
      description = "Toggle tag.",
      on_press = function(index)
        local screen = Awful.screen.focused()
        if not screen then return end
        local tag = screen.tags[index]
        if tag then Awful.tag.viewtoggle(tag) end
      end,
    },
    {
      modifiers = SUPER + SHIFT,
      keygroup = NUMROW,
      description = "Move focused client to tag.",
      on_press = function(index)
        if client.focus then
          local tag = client.focus.screen.tags[index]
          if tag then client.focus:move_to_tag(tag) end
        end
      end,
    },
    {
      modifiers = SUPER + CTRL + SHIFT,
      keygroup = NUMROW,
      description = "Toggle focused client on tag.",
      on_press = function(index)
        if client.focus then
          local tag = client.focus.screen.tags[index]
          if tag then client.focus:toggle_tag(tag) end
        end
      end,
    },
  },
  layout = {
    {
      modifiers = SUPER,
      keygroup = NUMPAD,
      description = "Select layout directly.",
      on_press = function(index)
        local selected_tag = Awful.screen.focused().selected_tag
        if selected_tag then selected_tag.layout = selected_tag.layouts[index] or selected_tag.layout end
      end,
    },
  }
}
