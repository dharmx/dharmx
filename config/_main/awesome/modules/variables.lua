local gears = require("gears")
local beautiful = require("beautiful")
local config = require("core.config")._current.modules.variables

beautiful.init(string.format("%sthemes/%s/theme.lua", gears.filesystem.get_configuration_dir(), config.theme))
terminal = config.terminal
editor = config.editor
editor_cmd = config.editor_cmd
modkey = config.modkey
