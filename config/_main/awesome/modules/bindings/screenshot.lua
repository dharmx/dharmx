local helpers = require("core.helpers")
local enum = require("core.enum")
local SHIFT = enum.modifiers.SHIFT
local CTRL = enum.modifiers.CTRL
local EMPTY = enum.modifiers.EMPTY

return {
  {
    modifiers = EMPTY,
    key = "Print",
    on_press = function() helpers.screenshot.saved({ auto_save_delay = 0 }) end,
    description = "Take screenshot.",
  },
  {
    modifiers = SHIFT,
    key = "Print",
    on_press = function() helpers.screenshot.saved({ auto_save_delay = 0, interactive = true }) end,
    description = "Take interactive screenshot.",
  },
  {
    modifiers = CTRL,
    key = "Print",
    on_press = function() helpers.screenshot.delayed({ auto_save_delay = 5 }) end,
    description = "Take screenshot in 5 seconds.",
  },
  {
    modifiers = SHIFT + CTRL,
    key = "Print",
    on_press = function() helpers.screenshot.delayed({ auto_save_delay = 5, interactive = true }) end,
    description = "Take interactive screenshot in 5 seconds.",
  },
}
