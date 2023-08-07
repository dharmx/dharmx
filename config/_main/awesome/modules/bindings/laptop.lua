local Awful = require("awful")

local functional = require("core.functional")
local enum = require("core.enum")
local environ = enum.environ

local EMPTY = enum.modifiers.EMPTY
local SUPER = enum.modifiers.SUPER
local video_process = nil

return {
  {
    modifiers = EMPTY,
    key = "XF86AudioLowerVolume",
    description = "Lower audio volume.",
    on_press = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "-5%" },
  },
  {
    modifiers = EMPTY,
    key = "XF86AudioRaiseVolume",
    description = "Raise audio volume.",
    on_press = { "pactl", "set-sink-volume", "@DEFAULT_SINK@", "+5%" },
  },
  {
    modifiers = EMPTY,
    key = "XF86AudioMicMute",
    description = "Mute and unmute microphone.",
    on_press = { "pactl", "set-source-mute", "@DEFAULT_SOURCE@" },
  },
  {
    modifiers = EMPTY,
    key = "XF86AudioMute",
    description = "Mute and unmute audio.",
    on_press = { "pactl", "set-sink-mute", "@DEFAULT_SINK@", "toggle" },
  },
  {
    modifiers = EMPTY,
    key = "XF86MonBrightnessUp",
    description = "Increase brightness.",
    on_press = "xbacklight -inc 5",
  },
  {
    modifiers = EMPTY,
    key = "XF86MonBrightnessDown",
    description = "Decrease brightness.",
    on_press = "xbacklight -dec 5",
  },
  {
    modifiers = EMPTY,
    key = "XF86AudioPlay",
    description = "Play and pause audio.",
    on_press = "playerctl toggle",
  },
  {
    modifiers = EMPTY,
    key = "XF86AudioStop",
    description = "Stop audio.",
    on_press = "playerctl stop",
  },
  {
    modifiers = EMPTY,
    key = "XF86AudioNext",
    description = "Move to next track.",
    on_press = "playerctl next",
  },
  {
    modifiers = EMPTY,
    key = "XF86AudioPrev",
    description = "Move to previous track.",
    on_press = "playerctl previous",
  },
  {
    modifiers = SUPER,
    key = "XF86AudioPlay",
    description = "Play and pause MPD audio.",
    on_press = "mpc toggle",
  },
  {
    modifiers = SUPER,
    key = "XF86AudioStop",
    description = "Stop MPD audio.",
    on_press = "mpc stop",
  },
  {
    modifiers = SUPER,
    key = "XF86AudioNext",
    description = "Move to next MPD track.",
    on_press = "mpc next",
  },
  {
    modifiers = SUPER,
    key = "XF86AudioPrev",
    description = "Move to previous MPD track.",
    on_press = "mpc prev",
  },
  {
    modifiers = SUPER,
    key = "XF86AudioLowerVolume",
    description = "Lower MPD volume.",
    on_press = "mpc -5",
  },
  {
    modifiers = SUPER,
    key = "XF86AudioRaiseVolume",
    description = "Raise MPD volume.",
    on_press = "mpc +5",
  },
  {
    modifiers = EMPTY,
    key = "XF86WebCam",
    description = "Video capture.",
    on_press = function()
      if video_process then
        if awesome.kill(video_process, 9) then video_process = nil end
        return
      end
      video_process = Awful.spawn.with_shell("qvidcap")
    end,
  },
  {
    modifiers = EMPTY,
    key = "XF86RFKill",
    description = "Airplane mode.",
    on_press = "rfkill toggle all",
  },
  {
    modifiers = EMPTY,
    key = "XF86HomePage",
    description = "Open homepage.",
    on_press = { environ.BROWSER, "https://www.google.com" },
  },
  {
    modifiers = EMPTY,
    key = "XF86Calculator",
    description = "Open calculator.",
    on_press = "qalculate-gtk",
  },
  {
    modifiers = EMPTY,
    key = "XF86Mail",
    description = "Open mail client.",
    on_press = functional.mute,
  },
  {
    modifiers = EMPTY,
    key = "Menu",
    description = "Menu.",
    on_press = functional.mute,
  },
  {
    modifiers = EMPTY,
    key = "XF86PowerOff",
    description = "Powermenu.",
    on_press = functional.mute,
  },
  {
    modifiers = EMPTY,
    key = "XF86Search",
    description = "Search.",
    on_press = functional.mute,
  },
}
