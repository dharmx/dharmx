local M = {}
local config = require("core.config")

function M.setup(options)
  -- Enable hotkeys help widget for VIM and other apps when client with a matching name is opened:
  require("awful.hotkeys_popup.keys")
  require("awful.autofocus")

  options = config.merge(options)
  require("modules.notifications")
  require("modules.variables")
  require("modules.menu")
  require("modules.tag")
  require("modules.wallpapers")
  require("modules.wibars")
  require("modules.mouse")
  require("modules.mappings")
  require("modules.rules")
  require("modules.titlebars")
end

return M
