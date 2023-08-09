local config = require("core.config").get().modules.wibars
local Awful = require("awful")

require("awful.autofocus")
local style = require("modules.bars." .. config.style)
mykeyboardlayout = style.keyboardlayout
mytextclock = style.textclock

screen.connect_signal("request::desktop_decoration", function(local_screen)
  Awful.tag(config.tag, local_screen, Awful.layout.layouts[1])
  -- local_screen.mypromptbox = style.promptbox
  -- local_screen.mylayoutbox = style.layoutbox(local_screen)
  -- local_screen.mytaglist = style.taglist(local_screen)
  -- local_screen.mytasklist = style.tasklist(local_screen)
  -- local_screen.mywibox = style.wibox(local_screen)
end)
