local util = require("core.util")
local config = require("core.config").get().modules.variables

local IconTheme = util.get_icon_theme(config.icon_theme)
local Assets = require("beautiful.theme_assets")
local Xresources = require("beautiful.xresources")
local Ruled = require("ruled")
local Tiny = require("lib.tiny")

local environ = require("core.enum").environ
local theme = { name = "radium" }
local path = environ.XDG_CONFIG_HOME .. "/awesome/themes/" .. theme.name

theme.icon_theme = config.icon_theme

theme.font = "Dosis 10"

-- black:   "#171C21"
-- red:     "#fa6969"
-- green:   "#36C692"
-- yellow:  "#FFCE66"
-- blue:    "#7AB0DF"
-- magenta: "#B77EE0"
-- cyan:    "#54CED6"
-- white:   "#FFFFFF"
-- black:   "#101419"
-- red:     "#F87070"
-- green:   "#79DCAA"
-- yellow:  "#FFE59E"
-- blue:    "#7AB0DF"
-- magenta: "#C397D8"
-- cyan:    "#70C0BA"
-- white:   "#D4D4D5"

theme.titlebar_height = Xresources.apply_dpi(40)

theme.bg_focus = Tiny("#101419"):lighten(2):to_hex(true)
theme.bg_normal = Tiny("#171C21"):darken(2):to_hex(true)
theme.bg_urgent = Tiny("#F87070"):to_hex(true)
theme.bg_minimize = Tiny(theme.bg_normal):lighten(2):to_hex(true)
theme.bg_systray = theme.bg_normal

theme.fg_normal = Tiny("#D4D4D5"):to_hex(true)
theme.fg_focus = Tiny("#D4D4D5"):to_hex(true)
theme.fg_urgent = Tiny("#D4D4D5"):to_hex(true)
theme.fg_minimize = Tiny("#FFFFFF"):to_hex(true)

theme.useless_gap = Xresources.apply_dpi(10)
theme.border_width = Xresources.apply_dpi(0)
theme.border_color_normal = Tiny("#79DCAA"):to_hex(true)
theme.border_color_active = Tiny("#C397D8"):to_hex(true)
theme.border_color_marked = Tiny("#F87070"):brighten(5):to_hex(true)

local taglist_square_size = Xresources.apply_dpi(4)
theme.taglist_squares_sel = Assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = Assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

theme.menu_submenu_icon = string.format("%s/submenu.png", path)
theme.menu_height = Xresources.apply_dpi(15)
theme.menu_width = Xresources.apply_dpi(100)

theme.titlebar_close_button_normal = IconTheme:get_icon_path("custom-close-window")
theme.titlebar_close_button_focus = IconTheme:get_icon_path("custom-close-window")

theme.titlebar_maximized_button_normal_active = IconTheme:get_icon_path("custom-maximize-window")
theme.titlebar_maximized_button_normal_inactive = IconTheme:get_icon_path("custom-maximize-window")
theme.titlebar_maximized_button_focus_inactive = IconTheme:get_icon_path("custom-maximize-window")

theme.titlebar_minimize_button_normal = IconTheme:get_icon_path("custom-minimize-window")
theme.titlebar_minimize_button_focus = IconTheme:get_icon_path("custom-minimize-window")

theme.wallpaper = string.format("%s/background.png", path)

-- {{{
theme.titlebar_ontop_button_normal_inactive = string.format("%s/titlebar/ontop_normal_inactive.png", path)
theme.titlebar_ontop_button_normal_active = string.format("%s/titlebar/ontop_normal_active.png", path)
theme.titlebar_ontop_button_focus_inactive = string.format("%s/titlebar/ontop_focus_inactive.png", path)
theme.titlebar_ontop_button_focus_active = string.format("%s/titlebar/ontop_focus_active.png", path)

theme.titlebar_sticky_button_normal_inactive = string.format("%s/titlebar/sticky_normal_inactive.png", path)
theme.titlebar_sticky_button_normal_active = string.format("%s/titlebar/sticky_normal_active.png", path)
theme.titlebar_sticky_button_focus_inactive = string.format("%s/titlebar/sticky_focus_inactive.png", path)
theme.titlebar_sticky_button_focus_active = string.format("%s/titlebar/sticky_focus_active.png", path)

theme.titlebar_floating_button_normal_inactive = string.format("%s/titlebar/floating_normal_inactive.png", path)
theme.titlebar_floating_button_focus_inactive = string.format("%s/titlebar/floating_focus_inactive.png", path)
theme.titlebar_floating_button_normal_active = string.format("%s/titlebar/floating_normal_active.png", path)
theme.titlebar_floating_button_focus_active = string.format("%s/titlebar/floating_focus_active.png", path)
theme.titlebar_maximized_button_focus_active = IconTheme:get_icon_path("custom-minimize-window")

theme.layout_fairh = string.format("%s/layouts/fairhw.png", path)
theme.layout_fairv = string.format("%s/layouts/fairvw.png", path)
theme.layout_floating = string.format("%s/layouts/floatingw.png", path)
theme.layout_magnifier = string.format("%s/layouts/magnifierw.png", path)
theme.layout_max = string.format("%s/layouts/maxw.png", path)
theme.layout_fullscreen = string.format("%s/layouts/fullscreenw.png", path)
theme.layout_tilebottom = string.format("%s/layouts/tilebottomw.png", path)
theme.layout_tileleft = string.format("%s/layouts/tileleftw.png", path)
theme.layout_tile = string.format("%s/layouts/tilew.png", path)
theme.layout_tiletop = string.format("%s/layouts/tiletopw.png", path)
theme.layout_spiral = string.format("%s/layouts/spiralw.png", path)
theme.layout_dwindle = string.format("%s/layouts/dwindlew.png", path)
theme.layout_cornernw = string.format("%s/layouts/cornernww.png", path)
theme.layout_cornerne = string.format("%s/layouts/cornernew.png", path)
theme.layout_cornersw = string.format("%s/layouts/cornersww.png", path)
theme.layout_cornerse = string.format("%s/layouts/cornersew.png", path)
theme.awesome_icon = Assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)

Ruled.notification.connect_signal("request::rules", function()
  Ruled.notification.append_rule({
    rule = { urgency = "critical" },
    properties = {
      bg = Tiny("#AC8A8C"):to_hex(true),
      fg = Tiny("#F0F0F0"):to_hex(true),
    },
  })
end)
-- }}}

return theme
