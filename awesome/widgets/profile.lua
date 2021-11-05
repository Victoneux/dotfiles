local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local profileimagebox = wibox.widget {
    widget = wibox.container.margin,
    margins = 10,
    {
        widget = wibox.container.background,
        shape = gears.shape.circle,
        shape_clip = true,
        {
            widget = wibox.container.place,
            {
                image = "/home/victoneux/Downloads/pfp.png",
                resize = true,
                widget = wibox.widget.imagebox
            }
        }
    }
}

local profilename = wibox.widget {
    layout = wibox.container.place,
    {
        widget = wibox.container.background,
        bg = beautiful.cool1,
        shape = gears.shape.rounded_rect,
        {
            widget = wibox.container.margin,
            top = 5,
            bottom = 5,
            left = 25,
            right = 25,
            wibox.widget.textbox("Victoneux")
        }
    }
}

local thewidget = wibox.widget {
    profileimagebox,
    profilename,
    layout = wibox.layout.ratio.vertical,
}

thewidget:set_ratio(1, 0.8)

return thewidget