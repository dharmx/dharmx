local M = {}

local Gears = require("gears")
local Filesystem = require("lfs")

local config = require("core.config")
local util = require("core.util")

function M.setup(options)
  -- Enable hotkeys help widget for VIM and other apps when client with a matching name is opened:
  require("awful.hotkeys_popup.keys")
  require("awful.autofocus")

  options = config.merge(options)
  local excludes = { ".", "..", "init.lua", "variables.lua" }
  require("modules.variables")
  for file in Filesystem.dir(Gears.filesystem.get_configuration_dir() .. "/modules") do
    if not Gears.table.hasitem(excludes, file) then
      require("modules." .. util.stem(file))
    end
  end
end

return M
