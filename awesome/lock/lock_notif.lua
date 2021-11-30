local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local lock_pic = wibox.widget {
    widget = wibox.container.background,
    bg = beautiful.transparent,
    shape = function(cr,w,h) gears.shape.rounded_rect(cr,w,h,5) end,
    shape_clip = true,
    {
        widget = wibox.widget.imagebox,
        image = home_dir .. "/dotfiles/awesome/images/lock.png",
        align = "center",
        forced_width = 90,
        forced_height = 120,
    }
}

local seperator = wibox.widget {
    widget = wibox.widget.seperator,
    forced_width = 20,
    opacity = 0,
}

local the_widget = wibox.widget {
    widget = wibox.container.background,
    bg = beautiful.color0,
    shape = function(cr,w,h) gears.shape.rounded_rect(cr,w,h,9) end,
    {
        widget = wibox.container.margin,
        margins = 20,
        {
            widget = wibox.layout.align.horizontal,
            {
                widget = wibox.layout.flex.vertical,
                {
                    widget = wibox.widget.textbox,
                    font = 'Roboto Bold 15',
                    text = "Locked",
                    align = "right",
                    valign = "bottom",
                },
                {
                    widget = wibox.widget.textbox,
                    font = 'Roboto 15',
                    text = "If you're not me, go away",
                    align = "right",
                    valign = "top",
                },
            },
            seperator,
            lock_pic,
        }
    }
}

return the_widget