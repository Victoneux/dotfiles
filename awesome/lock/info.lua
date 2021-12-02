local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local username = os.getenv("USER")

local profile_pic = wibox.widget {
    widget = wibox.container.background,
    bg = beautiful.transparent,
    shape = function(cr,w,h) gears.shape.rounded_rect(cr,w,h,5) end,
    shape_clip = true,
    {
        widget = wibox.widget.imagebox,
        image = home_dir .. "/dotfiles/pfp.png",
        align = "center",
        forced_width = 120,
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
            profile_pic,
            seperator,
            {
                widget = wibox.layout.flex.vertical,
                {
                    widget = wibox.widget.textclock(),
                    format = "<span font='Roboto 15' foreground=" .. "'" .. beautiful.fg_normal .. "'" .. ">%H:%M</span>",
                    valign = "bottom",
                },
                {
                    widget = wibox.widget.textbox,
                    font = 'Roboto 15',
                    text = username,
                    align = "center",
                    valign = "top",
                },
            }
        }
    }
}

return the_widget