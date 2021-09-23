local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

networkstatus = "f"

thewidget, network_timer = awful.widget.watch("nmcli networking", 100, function(widget, stdout)
    networkstatus = stdout
    local output = "Ntwk: " .. stdout
    widget:set_text(output)
    return
end)

local thewidget2 = wibox.widget {
    widget = wibox.container.margin,
    top = 4,
    bottom = 4,
    {
        widget = wibox.container.background,
        bg = beautiful.cool1,
        forced_width = dpi(105),
        shape = function(cr,w,h)
            gears.shape.rounded_rect(cr,w,h,4)
        end,
        {
            widget = thewidget,
            align = "center",
        }
    }
}

return thewidget2