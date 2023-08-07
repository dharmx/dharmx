local enum = require("core.enum")
local SUPER = enum.modifiers.SUPER
local ALT = enum.modifiers.ALT

return {
  wm = {
    {
      modifiers = SUPER + ALT,
      key = "r",
      description = "Reload awesome.",
      on_press = awesome.restart,
    },
    {
      modifiers = SUPER + ALT,
      key = "q",
      description = "Quit awesome.",
      on_press = awesome.quit,
    },
  },
}
