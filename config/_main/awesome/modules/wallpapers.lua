local Awful = require("awful")
local Beautiful = require("beautiful")
local Wibox = require("wibox")

screen.connect_signal("request::wallpaper", function(local_screen)
  Awful.wallpaper({
    screen = local_screen,
    widget = {
      {
        image = Beautiful.wallpaper,
        upscale = true,
        downscale = true,
        widget = Wibox.widget.imagebox,
      },
      valign = "center",
      halign = "center",
      tiled = false,
      widget = Wibox.container.tile,
    },
  })
end)
