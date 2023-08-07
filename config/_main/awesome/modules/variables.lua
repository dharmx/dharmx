local Beautiful = require("beautiful")
local config = require("core.config").get().modules.variables
local theme = require("themes." .. config.theme .. ".theme")

Beautiful.init(theme)
terminal = config.terminal
editor = config.editor
editor_cmd = config.editor_cmd
modkey = config.modkey
