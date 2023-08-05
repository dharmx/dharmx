local Assets = require("beautiful.theme_assets")
local Xresources = require("beautiful.xresources")
local Ruled = require("ruled")
local Tiny = require("lib.tiny")

local environ = require("core.enum").environ
local theme = { name = "mountain" }
local themes_path = environ.XDG_CONFIG_HOME .. "/awesome/themes/" .. theme.name

theme.font = "Dosis 10"
theme.bg_normal = Tiny:new({ hex = "#0F0F0F" }):to_hex(true)
theme.bg_focus = Tiny:new({ hex = "#191919" }):to_hex(true)
theme.bg_urgent = Tiny:new({ hex = "#AC8A8C" }):to_hex(true)
theme.bg_minimize = "#444444"
theme.bg_systray = theme.bg_normal

theme.fg_normal = Tiny:new({ hex = "#F0F0F0" }):to_hex(true)
theme.fg_focus = Tiny:new({ hex = "#F0F0F0" }):to_hex(true)
theme.fg_urgent = Tiny:new({ hex = "#F0F0F0" }):to_hex(true)
theme.fg_minimize = Tiny:new({ hex = "#E7E7E7" }):to_hex(true)

theme.useless_gap = Xresources.apply_dpi(0)
theme.border_width = Xresources.apply_dpi(1)
theme.border_color_normal = Tiny:new({ hex = "#8AAC8B" }):to_hex(true)
theme.border_color_active = Tiny:new({ hex = "#8F8AAC" }):to_hex(true)
theme.border_color_marked = Tiny:new({ hex = "#AC8A8C" }):brighten(5):to_hex(true)

local taglist_square_size = Xresources.apply_dpi(4)
theme.taglist_squares_sel = Assets.taglist_squares_sel(taglist_square_size, theme.fg_normal)
theme.taglist_squares_unsel = Assets.taglist_squares_unsel(taglist_square_size, theme.fg_normal)

theme.menu_submenu_icon = string.format("%s/submenu.png", themes_path)
theme.menu_height = Xresources.apply_dpi(15)
theme.menu_width = Xresources.apply_dpi(100)

theme.titlebar_close_button_normal = string.format("%s/titlebar/close_normal.png", themes_path)
theme.titlebar_close_button_focus = string.format("%s/titlebar/close_focus.png", themes_path)

theme.titlebar_minimize_button_normal = string.format("%s/titlebar/minimize_normal.png", themes_path)
theme.titlebar_minimize_button_focus = string.format("%s/titlebar/minimize_focus.png", themes_path)

theme.titlebar_ontop_button_normal_inactive = string.format("%s/titlebar/ontop_normal_inactive.png", themes_path)
theme.titlebar_ontop_button_focus_inactive = string.format("%s/titlebar/ontop_focus_inactive.png", themes_path)
theme.titlebar_ontop_button_normal_active = string.format("%s/titlebar/ontop_normal_active.png", themes_path)
theme.titlebar_ontop_button_focus_active = string.format("%s/titlebar/ontop_focus_active.png", themes_path)

theme.titlebar_sticky_button_normal_inactive = string.format("%s/titlebar/sticky_normal_inactive.png", themes_path)
theme.titlebar_sticky_button_focus_inactive = string.format("%s/titlebar/sticky_focus_inactive.png", themes_path)
theme.titlebar_sticky_button_normal_active = string.format("%s/titlebar/sticky_normal_active.png", themes_path)
theme.titlebar_sticky_button_focus_active = string.format("%s/titlebar/sticky_focus_active.png", themes_path)

theme.titlebar_floating_button_normal_inactive = string.format("%s/titlebar/floating_normal_inactive.png", themes_path)
theme.titlebar_floating_button_focus_inactive = string.format("%s/titlebar/floating_focus_inactive.png", themes_path)
theme.titlebar_floating_button_normal_active = string.format("%s/titlebar/floating_normal_active.png", themes_path)
theme.titlebar_floating_button_focus_active = string.format("%s/titlebar/floating_focus_active.png", themes_path)

theme.titlebar_maximized_button_normal_inactive = string.format("%s/titlebar/maximized_normal_inactive.png", themes_path)
theme.titlebar_maximized_button_focus_inactive = string.format("%s/titlebar/maximized_focus_inactive.png", themes_path)
theme.titlebar_maximized_button_normal_active = string.format("%s/titlebar/maximized_normal_active.png", themes_path)
theme.titlebar_maximized_button_focus_active = string.format("%s/titlebar/maximized_focus_active.png", themes_path)

theme.wallpaper = string.format("%s/background.jpg", themes_path)

theme.layout_fairh = string.format("%s/layouts/fairhw.png", themes_path)
theme.layout_fairv = string.format("%s/layouts/fairvw.png", themes_path)
theme.layout_floating = string.format("%s/layouts/floatingw.png", themes_path)
theme.layout_magnifier = string.format("%s/layouts/magnifierw.png", themes_path)
theme.layout_max = string.format("%s/layouts/maxw.png", themes_path)
theme.layout_fullscreen = string.format("%s/layouts/fullscreenw.png", themes_path)
theme.layout_tilebottom = string.format("%s/layouts/tilebottomw.png", themes_path)
theme.layout_tileleft = string.format("%s/layouts/tileleftw.png", themes_path)
theme.layout_tile = string.format("%s/layouts/tilew.png", themes_path)
theme.layout_tiletop = string.format("%s/layouts/tiletopw.png", themes_path)
theme.layout_spiral = string.format("%s/layouts/spiralw.png", themes_path)
theme.layout_dwindle = string.format("%s/layouts/dwindlew.png", themes_path)
theme.layout_cornernw = string.format("%s/layouts/cornernww.png", themes_path)
theme.layout_cornerne = string.format("%s/layouts/cornernew.png", themes_path)
theme.layout_cornersw = string.format("%s/layouts/cornersww.png", themes_path)
theme.layout_cornerse = string.format("%s/layouts/cornersew.png", themes_path)

theme.awesome_icon = Assets.awesome_icon(theme.menu_height, theme.bg_focus, theme.fg_focus)
theme.icon_theme = environ.XDG_DATA_HOME .. "/icons/custom"

Ruled.notification.connect_signal("request::rules", function()
  Ruled.notification.append_rule({
    rule = { urgency = "critical" },
    properties = {
      bg = Tiny:new({ hex = "#AC8A8C" }):to_hex(true),
      fg = Tiny:new({ hex = "#F0F0F0" }):to_hex(true),
    },
  })
end)
return theme
