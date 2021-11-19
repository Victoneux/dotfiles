local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local _doge = function(s)
    local doge = wibox {
        visible = false,
        ontop = true,
        type = 'normal',
        input_passthrough = true,
        height = 150,
        width = 300,
        screen = s,
        bg = beautiful.transparent,
    }

    local doge_text = wibox.widget {
        widget = wibox.widget.textbox,
        text = "",
        font = 'Roboto Bold 11'
    }

    doge : setup {
        widget = wibox.container.background,
        bg = beautiful.color0,
        {
            widget = wibox.container.margin,
            margins = 15,
            {
                widget = wibox.layout.flex.vertical,
                doge_text
            }
        }
    }
    
    awesome.connect_signal("evil::doge", function(output)
        doge_text.text = output
    end)

    return doge
end

return _doge