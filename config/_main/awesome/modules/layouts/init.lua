local Awful = require("awful")

tag.connect_signal("request::default_layouts", function()
  Awful.layout.append_default_layouts({
    Awful.layout.suit.tile,
    Awful.layout.suit.fair,
    Awful.layout.suit.max,
    Awful.layout.suit.max.fullscreen,
    Awful.layout.suit.floating,
  })
end)
