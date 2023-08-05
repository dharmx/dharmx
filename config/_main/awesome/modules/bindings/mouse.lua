local Awful = require("awful")
local EMPTY = require("core.enum").modifiers.EMPTY

return {
  {
    modifiers = EMPTY,
    button = 3,
    description = "Toggle main menu.",
    on_press = function() mymainmenu:toggle() end,
  },
  {
    modifiers = EMPTY,
    button = 1,
    description = "Close main menu.",
    on_press = function() mymainmenu:hide() end,
  },
  {
    modifiers = EMPTY,
    button = 4,
    description = "View previous tag.",
    on_press = Awful.tag.viewprev,
  },
  {
    modifiers = EMPTY,
    button = 4,
    description = "View next tag.",
    on_press = Awful.tag.viewnext,
  },
}
