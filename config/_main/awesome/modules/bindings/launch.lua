local Awful = require("awful")
local Menu = require("menubar")

local enum = require("core.enum")
local MOD = enum.modifiers.MOD
local CTRL  = enum.modifiers.CTRL
local SHIFT  = enum.modifiers.SHIFT

return {
  {
    modifiers = MOD,
    key = "Return",
    description = "Open " .. terminal .. ".",
    on_press = terminal,
  },
  {
    modifiers = MOD + CTRL,
    key = "Return",
    description = "Open a playground tmux session.",
    on_press = { terminal, "-e", "tmux", "new-session", "-A", "-s", "playground" },
  },
  {
    modifiers = MOD,
    key = "d",
    description = "Show the menu.",
    on_press = function() Menu.show() end,
  },
  {
    modifiers = MOD + SHIFT,
    key = "f",
    description = "Open " .. enum.environ.BROWSER .. ".",
    on_press = enum.environ.BROWSER,
  },
  {
    modifiers = MOD,
    key = "e",
    description = "Open file browsing application.",
    on_press = { terminal, "-e", "ranger" },
  },
  {
    modifiers = CTRL + SHIFT,
    key = "Escape",
    description = "Show the BTOP.",
    on_press = { terminal, "-e", "btop" },
  },
}
