local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local thewidget = wibox.widget {
    widget = wibox.widget.seperator,
    forced_height = 50,
    opacity = 0,
}

return thewidget