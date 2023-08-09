local config = require("core.config").get().modules.titlebars

local Awful = require("awful")
local Beautiful = require("beautiful")
require("awful.autofocus")

client.connect_signal("request::titlebars", function(node)
  Awful.titlebar(node, {
    position = "top",
    size = Beautiful.titlebar_height,
  }).widget = require("modules.titlebars." .. config.style).initialize(node)
end)
