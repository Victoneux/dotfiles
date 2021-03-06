local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local thewidget = wibox.widget {
    widget = wibox.container.margin,
    top = 4,
    bottom = 4,
    left = 4,
    right = 4,
    {
        widget = wibox.widget.textclock("<span font='" .. beautiful.font .. "' foreground=" .. "'" .. beautiful.fg_normal .. "'" .. ">%H:%M</span>", 1),
        align = "center"
    }
}

return thewidget