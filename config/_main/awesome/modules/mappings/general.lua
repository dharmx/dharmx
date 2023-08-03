local Awful = require("awful")
local Menu = require("menubar")
local Popup = require("awful.hotkeys_popup")

local enum = require("core.enum")
local MOD = enum.modifiers.MOD
local CTRL  = enum.modifiers.CTRL
local SHIFT = enum.modifiers.SHIFT

local mappings = {
  launcher = {
    {
      modifiers = MOD,
      key = "Return",
      description = "Open " .. terminal .. ".",
      on_press = function() Awful.spawn(terminal) end,
    },
    {
      modifiers = MOD + CTRL,
      key = "Return",
      description = "Open a playground tmux session.",
      on_press = function() Awful.spawn(terminal .. " -e tmux new-session -A -s playground") end,
    },
    {
      modifiers = MOD,
      key = "r",
      description = "Run prompt.",
      on_press = function()
        local mypromptbox = Awful.screen.focused()
        if mypromptbox then mypromptbox:run() end
      end,
    },
    {
      modifiers = MOD,
      key = "p",
      description = "Show the menu.",
      on_press = function() Menu.show() end,
    },
  },
  awesome = {
    {
      modifiers = MOD,
      key = "s",
      description = "Show help.",
      on_press = Popup.show_help,
    },
    {
      modifiers = MOD,
      key = "w",
      description = "Show main menu.",
      on_press = function() mymainmenu:show() end,
    },
    {
      modifiers = MOD + CTRL,
      key = "r",
      description = "Reload awesome.",
      on_press = awesome.restart,
    },
    {
      modifiers = MOD + SHIFT,
      key = "q",
      description = "Quit awesome.",
      on_press = awesome.quit,
    },
    {
      modifiers = MOD + SHIFT,
      key = "x",
      description = "Lua execute prompt.",
      on_press = function()
        Awful.prompt.run({
          prompt = "Run Lua code: ",
          textbox = Awful.screen.focused().mypromptbox.widget,
          exe_callback = Awful.util.eval,
          history_path = Awful.util.get_cache_dir() .. "/history_eval",
        })
      end,
    }
  },
}

return mappings
