local Gears = require("gears")
local Filesystem = require("lfs")

local util = require("core.util")
local std = require("core.std")
local excludes = { ".", "..", "init.lua", "mouse.lua" }

for file in Filesystem.dir(Gears.filesystem.get_configuration_dir() .. "/modules/bindings") do
  if not Gears.table.hasitem(excludes, file) then
    local stem = util.stem(file)
    local bindings = require("modules.bindings." .. stem)
    if std.table.is_list(bindings) then bindings = { [stem] = bindings } end
    util.apply_global_bindings(bindings)
  end
end

local mouse = require("modules.bindings.mouse")
util.apply_global_bindings({ mouse = mouse }, true)

client.connect_signal("request::default_mousebindings", function()
  local node_mouse = require("modules.bindings.node.mouse")
  util.apply_client_bindings({ mouse = node_mouse }, true)
end)

client.connect_signal("request::default_keybindings", function()
  local node_keyboard = require("modules.bindings.node.keyboard")
  util.apply_client_bindings({ keyboard = node_keyboard })
end)
