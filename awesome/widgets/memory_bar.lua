local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Set colors
local active_color = beautiful.peach
local background_color = beautiful.dark3

local memory_bar = wibox.widget {
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

local memory_bar_2 = wibox.widget {
    layout = wibox.container.rotate,
    direction = "east",
    memory_bar
}

local memory_text = wibox.widget {
    widget = wibox.widget.textbox,
    text = "wow",
    align = "center",
    font = "Roboto Bold 12"
}

local the_widget = {
    widget = wibox.layout.stack,
    memory_bar_2,
    memory_text
}

awesome.connect_signal("evil::memory", function(used, total)

    local percent = math.floor((used / total) * 100)

    memory_bar.value = percent
    memory_text.text = tostring("\n" .. percent .. "%")
end)

return the_widget