local Beautiful = require("beautiful")
local Awful = require("awful")
local Menu = require("menubar")
local HotkeysPopup = require("awful.hotkeys_popup")

myawesomemenu = {
  { "Hotkeys", function() HotkeysPopup.show_help() end },
  { "Restart", awesome.restart },
  { "Quit", function() awesome.quit(0) end },
}

mymainmenu = Awful.menu({
  items = {
    { "AwesomeWM", myawesomemenu, Beautiful.awesome_icon },
  },
})

mylauncher = Awful.widget.launcher({ image = Beautiful.awesome_icon, menu = mymainmenu })
Menu.utils.terminal = terminal
