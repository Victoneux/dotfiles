local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local _panel = function(s)
    local panel = wibox {
        visible = false,
        ontop = true,
        splash = false,
        type = 'dock',
        width = s.geometry.width*0.95,
        height = 300,
        screen = s,
        bg = beautiful.cool1,
    }

    awful.placement.bottom(panel)

    local panel_widget = wibox.widget {
        expand = 'none',
        spacing = 4,
        layout = wibox.layout.grid,
        spacing = 5,
    }
    panel_widget:add_widget_at(require("widgets/profile"), 1, 1, 2, 1)
    panel_widget:add_widget_at(require("widgets/profile"), 1, 2, 2, 1)

    local panel_widget2 = wibox.widget {
        widget = wibox.container.margin,
        margins = 5,
        panel_widget
    }

    panel : setup {
        layout = wibox.container.margin,
        top = 4,
        left = 4,
        right = 4,
        {
            layout = wibox.container.background,
            bg = beautiful.background,
            panel_widget2
        }
    }

    return panel
end

return _panel