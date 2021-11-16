local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Set colors
local active_color = beautiful.volume_bar_active_color or "#5AA3CC"
local muted_color = beautiful.volume_bar_muted_color or "#666666"
local background_color = "#222222"

local volume_bar = wibox.widget {
    max_value     = 100,
    value         = 50,
    shape         = gears.shape.rounded_bar,
    bar_shape     = gears.shape.rounded_bar,
    color         = active_color,
    background_color = background_color,
    border_width  = 0,
    border_color  = beautiful.border_color,
    widget        = wibox.widget.progressbar,
}

local volume_text = wibox.widget {
    widget = wibox.widget.textbox,
    text = "wow",
    align = "center",
    font = "Roboto Bold 12"
}

local volume_bar_2 = wibox.widget {
    layout = wibox.container.rotate,
    direction = 'east',
    volume_bar,
}

local thewidget = {
    widget = wibox.layout.stack,
    volume_bar_2,
    volume_text
}

awesome.connect_signal("evil::volume", function(volume, muted)
    local bg_color
    if muted then
        fill_color = muted_color
        volume_text.text = "ﱝ\n" .. volume .. "%"
    else
        fill_color = active_color
        volume_text.text = "墳\n" .. volume .. "%"
    end
    volume_bar.value = volume
    volume_bar.color = fill_color
end)

return thewidget