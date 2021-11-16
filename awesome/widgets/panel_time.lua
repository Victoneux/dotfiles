local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local one = wibox.widget {
    widget = wibox.widget.textclock("<span font='Roboto Bold 75' foreground=" .. "'" .. beautiful.fg_normal .. "'" .. ">%H %M</span>", 1),
    align = "center"
}
local two = wibox.widget {
    widget = wibox.widget.textclock("<span font='Roboto Bold 20' foreground=" .. "'" .. beautiful.fg_normal .. "'" .. ">%B %d,\n%Y</span>", 1),
    align = "center"
}

local the_widget = wibox.widget {
    layout = wibox.layout.fixed.vertical,
    one,
    two
}

return the_widget