local enum = require("core.enum")
local MOD = enum.modifiers.MOD
local ALT = enum.modifiers.ALT

return {
  wm = {
    {
      modifiers = MOD + ALT,
      key = "r",
      description = "Reload awesome.",
      on_press = awesome.restart,
    },
    {
      modifiers = MOD + ALT,
      key = "q",
      description = "Quit awesome.",
      on_press = awesome.quit,
    },
  },
}
