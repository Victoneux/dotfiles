local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local the_widget = wibox.widget {
    layout = wibox.layout.flex.horizontal,
    require("widgets/volume_bar"),
    require("widgets/volume_bar"),
    require("widgets/volume_bar"),
    require("widgets/volume_bar"),
    require("widgets/volume_bar"),

    spacing = 25,
}

return the_widget