local Gears = require("gears")
local Filesystem = require("lfs")

local util = require("core.util")
local excludes = { ".", "..", "init.lua", "defaults.lua", "mouse.lua" }
for file in Filesystem.dir(Gears.filesystem.get_configuration_dir() .. "/modules/mappings") do
  if not Gears.table.hasitem(excludes, file) then
    local mappings = require("modules.mappings." .. util.stem(file))
    util.apply_keybinds(mappings)
  end
end

client.connect_signal("request::default_mousebindings", function()
  local mouse = require("modules.mappings.mouse")
  util.apply_keybinds(mouse, true)
end)

client.connect_signal("request::default_keybindings", function()
  local defaults = require("modules.mappings.defaults")
  util.apply_keybinds(defaults)
end)
