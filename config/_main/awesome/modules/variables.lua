local Beautiful = require("beautiful")
local config = require("core.config").get()

Beautiful.init(require("themes." .. config.theme .. ".theme"))
terminal = config.modules.variables.terminal
editor = config.modules.variables.editor
editor_cmd = config.modules.variables.editor_cmd
modkey = config.modules.variables.modkey
