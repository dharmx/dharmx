local Awful = require("awful")
local Naughty = require("naughty")
local Ruled = require("ruled")

-- Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
Naughty.connect_signal("request::display_error", function(message, startup)
  Naughty.notification({
    urgency = "critical",
    title = "Oops, an error happened" .. (startup and " during startup!" or "!"),
    message = message,
  })
end)

-- Notifications
Ruled.notification.connect_signal("request::rules", function()
  -- All notifications will match this rule.
  Ruled.notification.append_rule({
    rule = {},
    properties = {
      screen = Awful.screen.preferred,
      implicit_timeout = 5,
    },
  })
end)

Naughty.connect_signal("request::display", function(notification)
  Naughty.layout.box({ notification = notification })
end)
