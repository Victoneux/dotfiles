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
    {
        widget = wibox.container.background,
        bg = beautiful.cool1,
        forced_width = dpi(160),
        shape = function(cr,w,h)
            gears.shape.rounded_rect(cr,w,h,4)
        end,
        {
            widget = wibox.widget.textclock("<span font='" .. beautiful.font .. "' foreground=" .. "'" .. beautiful.fg_normal .. "'" .. ">%a %b %d, %I:%M %p</span>", 1),
            align = "center"
        }
    }
}

return thewidget