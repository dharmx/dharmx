local Awful = require("awful")
local Beautiful = require("beautiful")
local Wibox = require("wibox")

screen.connect_signal("request::wallpaper", function(local_screen)
  Awful.wallpaper({
    screen = local_screen,
    widget = {
      upscale = false,
      downscale = true,
      horizontal_fit_policy = "fit",
      vertical_fit_policy   = "fit",
      image = Beautiful.wallpaper,
      widget = Wibox.widget.imagebox,
    },
  })
end)
