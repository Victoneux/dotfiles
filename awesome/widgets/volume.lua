local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

thewidget, volume_timer = awful.widget.watch('amixer -D pulse sget Master', 2, function(widget, stdout)
    local mute = string.match(stdout, "%[(o%D%D?)%]")
    local volume_level = string.match(stdout, "(%d?%d?%d)%%")
    if mute == 'off' then
        widget:set_text("Muted: " .. volume_level .. "%")
    elseif mute == 'on' then
        widget:set_text("Unmuted: " .. volume_level .. "%")
    end
    return
end)

local thewidget2 = wibox.widget {
    widget = wibox.container.margin,
    top = 4,
    bottom = 4,
    {
        widget = wibox.container.background,
        bg = beautiful.cool1,
        forced_width = dpi(100),
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