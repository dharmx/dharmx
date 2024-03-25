package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/tym/util.lua"
local tym = require("tym")
local util = require("util")

tym.set("width", 80)
tym.set("height", 20)
tym.set("cell_height", 125)
tym.set("font", "Iosevka Nerd Font 14")
tym.set_config({
  shell = "/usr/bin/zsh",
  cursor_shape = "block",
  autohide = true,
  padding_top = 25,
  padding_bottom = 25,
  padding_left = 20,
  padding_right = 20,
  term = "xterm-256color",
  cjk_width = "narrow",
  cursor_blink_mode = "off",
})

tym.set_hook("scroll", util.scale)
tym.set_keymaps({
  ["<Ctrl><Shift>R"] = function()
    tym.reload()
    tym.notify("Reloaded configurations!", "TYM Terminal")
  end,
})
