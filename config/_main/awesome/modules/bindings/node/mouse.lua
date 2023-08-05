local enum = require("core.enum")
local MOD = enum.modifiers.MOD
local EMPTY = enum.modifiers.EMPTY

return {
  {
    modifiers = EMPTY,
    button = 1,
    context = "mouse_click",
    description = "Add mouse click.",
    on_press = function(node) node:activate({ context = "mouse_click" }) end,
  },
  {
    modifiers = MOD,
    button = 1,
    description = "Add mouse drag.",
    on_press = function(node) node:activate({ context = "mouse_click", action = "mouse_move" }) end,
  },
  {
    modifiers = MOD,
    button = 3,
    description = "Add mouse resizing.",
    on_press = function(node) node:activate({ context = "mouse_click", action = "mouse_resize" }) end,
  },
}
