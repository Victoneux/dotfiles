local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local profileimagebox = wibox.widget {
    widget = wibox.container.margin,
    left = 10,
    right = 10,
    {
        widget = wibox.container.background,
        shape = gears.shape.circle,
        shape_clip = true,
        {
            widget = wibox.container.place,
            {
                image = "/home/victoneux/dotfiles/pfp.jpg",
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
        forced_width = 2000,
        forced_height = 1000,
        bg = beautiful.background,
        shape = gears.shape.rounded_rect,
        {
            widget = wibox.container.place,
            {
                widget = wibox.widget.textbox,
                text = "Victoneux",
                font = "Roboto 15"
            }
        }
    }
}

local thewidget = wibox.widget {
    profileimagebox,
    wibox.widget {
        forced_height = 0,
        forced_width = 0
    },
    {
        widget = wibox.container.margin,
        left = 50,
        right = 50,
        profilename
    },
    layout = wibox.layout.ratio.vertical,
    inner_fill_strategy = "spacing"
}

thewidget:ajust_ratio(2, 0.75, 0.1, 0.15)

thewidget2 = wibox.widget {
    widget = wibox.container.background,
    bg = beautiful.cool1,
    margins = 5,
    thewidget
}

return thewidget2