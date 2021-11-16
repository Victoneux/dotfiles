local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

-- Set colors
local active_color = beautiful.color3
local background_color = "#222222"

local disk_bar = wibox.widget {
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

local disk_bar_2 = wibox.widget {
    layout = wibox.container.rotate,
    direction = "east",
    disk_bar
}

local disk_text = wibox.widget {
    widget = wibox.widget.textbox,
    text = "wow",
    align = "center",
    font = "Roboto Bold 12"
}

local the_widget = {
    widget = wibox.layout.stack,
    disk_bar_2,
    disk_text
}

awesome.connect_signal("evil::disk", function(used, total)

    local percent = math.floor((used / total) * 100)

    disk_bar.value = percent
    disk_text.text = tostring("\n" .. percent .. "%")
end)

return the_widget