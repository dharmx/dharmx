local config = require("core.config").get()
local environ = require("core.enum").environ
local shapes = require("core.shapes")
-- load theme colors and its variant: raidum.[dark|light|black]
local colors = require("colors." .. config.colors).background[config.background]

local T = require("lib.tiny")
local DPI = require("beautiful.xresources").apply_dpi

local Assets = require("beautiful.theme_assets")
local Ruled = require("ruled")
local Gears = require("gears")

local theme = {}
local theme_path = Gears.filesystem.get_themes_dir() .. "stain"

theme.icon_theme = config.icon_theme
theme.font = "Nunito 10"
theme.titlebar_height = DPI(50)
theme.wallpaper = theme_path .. "/background.png"

theme.bg_focus = colors.black:lighten(2):to_hex(true)
theme.bg_normal = colors.bblack:darken(2):to_hex(true)
theme.bg_urgent = colors.red:to_hex(true)
theme.bg_minimize = colors.bblack:lighten(2):to_hex(true)
theme.bg_systray = colors.bblack:to_hex(true)

theme.fg_normal = colors.white:to_hex(true)
theme.fg_focus = colors.white:to_hex(true)
theme.fg_urgent = colors.white:to_hex(true)
theme.fg_minimize = colors.bwhite:to_hex(true)

theme.useless_gap = DPI(10)
theme.border_width = DPI(0)
theme.border_color_normal = colors.green:to_hex(true)
theme.border_color_active = colors.magenta:to_hex(true)
theme.border_color_marked = colors.red:brighten(5):to_hex(true)

theme.taglist_squares_sel = Assets.taglist_squares_sel(DPI(4), theme.fg_normal)
theme.taglist_squares_unsel = Assets.taglist_squares_unsel(DPI(4), theme.fg_normal)

theme.menu_submenu_icon = string.format("%s/submenu.png", theme_path)
theme.menu_height = DPI(15)
theme.menu_width = DPI(100)

theme.titlebar_close_button_normal = shapes.stain(10, colors.bred)
theme.titlebar_close_button_focus = shapes.stain(10, colors.red)
theme.titlebar_maximized_button_normal_active = shapes.stain(10, colors.bmagenta:darken(5))
theme.titlebar_maximized_button_normal_inactive = shapes.stain(10, colors.magenta:darken(5))
theme.titlebar_maximized_button_focus_active = shapes.stain(10, colors.bmagenta)
theme.titlebar_maximized_button_focus_inactive = shapes.stain(10, colors.magenta)
theme.titlebar_maximized_button_focus_active = shapes.stain(10, colors.green)
theme.titlebar_minimize_button_normal = shapes.stain(10, colors.cyan)
theme.titlebar_minimize_button_focus = shapes.stain(10, colors.bcyan)

-- {{{
theme.titlebar_ontop_button_normal_inactive = string.format("%s/titlebar/ontop_normal_inactive.png", theme_path)
theme.titlebar_ontop_button_normal_active = string.format("%s/titlebar/ontop_normal_active.png", theme_path)
theme.titlebar_ontop_button_focus_inactive = string.format("%s/titlebar/ontop_focus_inactive.png", theme_path)
theme.titlebar_ontop_button_focus_active = string.format("%s/titlebar/ontop_focus_active.png", theme_path)

theme.titlebar_sticky_button_normal_inactive = string.format("%s/titlebar/sticky_normal_inactive.png", theme_path)
theme.titlebar_sticky_button_normal_active = string.format("%s/titlebar/sticky_normal_active.png", theme_path)
theme.titlebar_sticky_button_focus_inactive = string.format("%s/titlebar/sticky_focus_inactive.png", theme_path)
theme.titlebar_sticky_button_focus_active = string.format("%s/titlebar/sticky_focus_active.png", theme_path)

theme.titlebar_floating_button_normal_inactive = string.format("%s/titlebar/floating_normal_inactive.png", theme_path)
theme.titlebar_floating_button_focus_inactive = string.format("%s/titlebar/floating_focus_inactive.png", theme_path)
theme.titlebar_floating_button_normal_active = string.format("%s/titlebar/floating_normal_active.png", theme_path)
theme.titlebar_floating_button_focus_active = string.format("%s/titlebar/floating_focus_active.png", theme_path)

theme.layout_fairh = string.format("%s/layouts/fairhw.png", theme_path)
theme.layout_fairv = string.format("%s/layouts/fairvw.png", theme_path)
theme.layout_floating = string.format("%s/layouts/floatingw.png", theme_path)
theme.layout_magnifier = string.format("%s/layouts/magnifierw.png", theme_path)
theme.layout_max = string.format("%s/layouts/maxw.png", theme_path)
theme.layout_fullscreen = string.format("%s/layouts/fullscreenw.png", theme_path)
theme.layout_tilebottom = string.format("%s/layouts/tilebottomw.png", theme_path)
theme.layout_tileleft = string.format("%s/layouts/tileleftw.png", theme_path)
theme.layout_tile = string.format("%s/layouts/tilew.png", theme_path)
theme.layout_tiletop = string.format("%s/layouts/tiletopw.png", theme_path)
theme.layout_spiral = string.format("%s/layouts/spiralw.png", theme_path)
theme.layout_dwindle = string.format("%s/layouts/dwindlew.png", theme_path)
theme.layout_cornernw = string.format("%s/layouts/cornernww.png", theme_path)
theme.layout_cornerne = string.format("%s/layouts/cornernew.png", theme_path)
theme.layout_cornersw = string.format("%s/layouts/cornersww.png", theme_path)
theme.layout_cornerse = string.format("%s/layouts/cornersew.png", theme_path)
theme.awesome_icon = Assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

Ruled.notification.connect_signal("request::rules", function()
  Ruled.notification.append_rule({
    rule = { urgency = "critical" },
    properties = {
      bg = T("#AC8A8C"):to_hex(true),
      fg = T("#F0F0F0"):to_hex(true),
    },
  })
end)
-- }}}

theme.flash_focus_start_opacity = 0.6
theme.flash_focus_step = 0.01

return theme
