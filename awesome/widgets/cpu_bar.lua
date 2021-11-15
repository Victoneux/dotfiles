local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Set colors
local active_color = beautiful.color1
local background_color = beautiful.volume_bar_active_background_color or "#222222"

local cpu_bar = wibox.widget {
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

local cpu_bar_2 = wibox.widget {
    layout = wibox.container.rotate,
    direction = "east",
    cpu_bar
}

local cpu_text = wibox.widget {
    widget = wibox.widget.textbox,
    text = "wow",
    align = "center",
    font = "Roboto Bold 12"
}

local the_widget = {
    widget = wibox.layout.stack,
    cpu_bar_2,
    cpu_text
}

awesome.connect_signal("evil::cpu", function(value)
    -- Use this if you want to display usage percentage
    -- cpu_bar.value = value
    -- Use this if you want to display idle percentage
    cpu_bar.value = value
    cpu_text.text = tostring(value .. "%")
end)

return the_widget