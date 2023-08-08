local M = {}
M.screenshot = {}
M.shapes = {}

local Awful = require("awful")
local Naughty = require("naughty")
local Gears = require("gears")
local DPI = require("beautiful.xresources").apply_dpi

function M.shapes.partial_squircle(options)
  return Gears.surface.load_from_shape(options.width, options.height, function(context, width, height)
    return Gears.shape.partial_squircle(
      context,
      DPI(width),
      DPI(height),
      options.corners.top_left,
      options.corners.top_right,
      options.corners.bottom_right,
      options.corners.bottom_left,
      DPI(options.rate),
      options.delta)
  end, options.shape_pattern:to_hex(true), options.background:to_hex(true))
end

function M.screenshot.saved(args)
  local screenshot = Awful.screenshot(args)
  local function notify(self)
    Naughty.notification({
      title = self.file_name,
      message = "Screenshot saved",
      icon = self.surface,
      icon_size = 128,
    })
  end
  if args.auto_save_delay > 0 then
    screenshot:connect_signal("file::saved", notify)
  else
    notify(screenshot)
  end
  return screenshot
end

function M.screenshot.delayed(args)
  local screenshot = M.screenshot.saved(args)
  local notification = Naughty.notification({
    title = "Screenshot in:",
    message = tostring(args.auto_save_delay) .. " seconds",
  })
  screenshot:connect_signal("timer::tick", function(_, remain)
    notification.message = tostring(remain) .. " seconds"
  end)
  screenshot:connect_signal("timer::timeout", function()
    if notification then notification:destroy() end
  end)
  return screenshot
end


return M
