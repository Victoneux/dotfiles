local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local thewidget = wibox.widget {
    widget = wibox.widget.seperator,
    forced_width = 4,
    opacity = 0,
}

return thewidget