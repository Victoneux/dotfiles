local gears = require("gears")
local themes_path = gears.filesystem.get_configuration_dir() .. "theme/"
local icons_path = themes_path .. "icons/"
local theme = require("theme/color")
local gtk = require("beautiful.gtk")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- theme.gtk = gtk.get_theme_variables()

-- Titlebar Icons
theme.titlebar_close_button_normal = icons_path .. "titlebar_icons/" .. "close_normal.svg"
theme.titlebar_close_button_focus  = icons_path .. "titlebar_icons/" .. "close_focus.svg"
theme.titlebar_minimize_button_normal = icons_path .. "titlebar_icons/" .. "minimize_normal.svg"
theme.titlebar_minimize_button_focus  = icons_path .. "titlebar_icons/" .. "minimize_focus.svg"
theme.titlebar_ontop_button_normal_inactive = icons_path .. "titlebar_icons/" .. "ontop_normal_inactive.svg"
theme.titlebar_ontop_button_focus_inactive  = icons_path .. "titlebar_icons/" .. "ontop_focus_inactive.svg"
theme.titlebar_ontop_button_normal_active = icons_path .. "titlebar_icons/" .. "ontop_normal_active.svg"
theme.titlebar_ontop_button_focus_active  = icons_path .. "titlebar_icons/" .. "ontop_focus_active.svg"
theme.titlebar_sticky_button_normal_inactive = icons_path .. "titlebar_icons/" .. "sticky_normal_inactive.svg"
theme.titlebar_sticky_button_focus_inactive  = icons_path .. "titlebar_icons/" .. "sticky_focus_inactive.svg"
theme.titlebar_sticky_button_normal_active = icons_path .. "titlebar_icons/" .. "sticky_normal_active.svg"
theme.titlebar_sticky_button_focus_active  = icons_path .. "titlebar_icons/" .. "sticky_focus_active.svg"
theme.titlebar_floating_button_normal_inactive = icons_path .. "titlebar_icons/" .. "floating_normal_inactive.svg"
theme.titlebar_floating_button_focus_inactive  = icons_path .. "titlebar_icons/" .. "floating_focus_inactive.svg"
theme.titlebar_floating_button_normal_active = icons_path .. "titlebar_icons/" .. "floating_normal_active.svg"
theme.titlebar_floating_button_focus_active  = icons_path .. "titlebar_icons/" .. "floating_focus_active.svg"
theme.titlebar_maximized_button_normal_inactive = icons_path .. "titlebar_icons/" .. "maximized_normal_inactive.svg"
theme.titlebar_maximized_button_focus_inactive  = icons_path .. "titlebar_icons/" .. "maximized_focus_inactive.svg"
theme.titlebar_maximized_button_normal_active = icons_path .. "titlebar_icons/" .. "maximized_normal_active.svg"
theme.titlebar_maximized_button_focus_active  = icons_path .. "titlebar_icons/" .. "maximized_focus_active.svg"

theme.titlebar_close_button_normal_hover = icons_path .. "titlebar_icons/" .. "close_normal_hover.svg"
theme.titlebar_close_button_focus_hover  = icons_path .. "titlebar_icons/" .. "close_focus_hover.svg"
theme.titlebar_minimize_button_normal_hover = icons_path .. "titlebar_icons/" .. "minimize_normal_hover.svg"
theme.titlebar_minimize_button_focus_hover  = icons_path .. "titlebar_icons/" .. "minimize_focus_hover.svg"
theme.titlebar_ontop_button_normal_inactive_hover = icons_path .. "titlebar_icons/" .. "ontop_normal_inactive_hover.svg"
theme.titlebar_ontop_button_focus_inactive_hover  = icons_path .. "titlebar_icons/" .. "ontop_focus_inactive_hover.svg"
theme.titlebar_ontop_button_normal_active_hover = icons_path .. "titlebar_icons/" .. "ontop_normal_active_hover.svg"
theme.titlebar_ontop_button_focus_active_hover  = icons_path .. "titlebar_icons/" .. "ontop_focus_active_hover.svg"
theme.titlebar_sticky_button_normal_inactive_hover = icons_path .. "titlebar_icons/" .. "sticky_normal_inactive_hover.svg"
theme.titlebar_sticky_button_focus_inactive_hover  = icons_path .. "titlebar_icons/" .. "sticky_focus_inactive_hover.svg"
theme.titlebar_sticky_button_normal_active_hover = icons_path .. "titlebar_icons/" .. "sticky_normal_active_hover.svg"
theme.titlebar_sticky_button_focus_active_hover  = icons_path .. "titlebar_icons/" .. "sticky_focus_active_hover.svg"
theme.titlebar_floating_button_normal_inactive_hover = icons_path .. "titlebar_icons/" .. "floating_normal_inactive_hover.svg"
theme.titlebar_floating_button_focus_inactive_hover  = icons_path .. "titlebar_icons/" .. "floating_focus_inactive_hover.svg"
theme.titlebar_floating_button_normal_active_hover = icons_path .. "titlebar_icons/" .. "floating_normal_active_hover.svg"
theme.titlebar_floating_button_focus_active_hover  = icons_path .. "titlebar_icons/" .. "floating_focus_active_hover.svg"
theme.titlebar_maximized_button_normal_inactive_hover = icons_path .. "titlebar_icons/" .. "maximized_normal_inactive_hover.svg"
theme.titlebar_maximized_button_focus_inactive_hover  = icons_path .. "titlebar_icons/" .. "maximized_focus_inactive_hover.svg"
theme.titlebar_maximized_button_normal_active_hover = icons_path .. "titlebar_icons/" .. "maximized_normal_active_hover.svg"
theme.titlebar_maximized_button_focus_active_hover  = icons_path .. "titlebar_icons/" .. "maximized_focus_active_hover.svg"

--Stuf
theme.wallpaper = themes_path .. "wallpaper.jpg"
theme.useless_gap = dpi(6)

-- Colors!
theme.transparent = '#ffffff00'

-- Some Other Stuff
theme.fg_normal = theme.foreground
theme.titlebar_bg = theme.dark2
theme.wibar_bg = theme.dark2
theme.bg_normal = theme.background
theme.font = "IBM Plex Sans Medium 11"
theme.tasklist_disable_task_name = true
theme.tasklist_plain_task_name = true
theme.tasklist_bg_normal = theme.transparent
theme.tasklist_bg_focus = theme.red
theme.layout_tile = icons_path .. "layouts/tile.svg"
theme.layout_floating = icons_path .. "layouts/floating.svg"

theme.icon_theme = "papirus"

theme.notification_margin = 200

theme.titlebar_height = dpi(40)
theme.topbar_height = dpi(34)

return theme
