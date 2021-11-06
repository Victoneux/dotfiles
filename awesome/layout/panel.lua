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
        shape = function(cr,w,h) gears.shape.partially_rounded_rect(cr,w,h,true,true,false,false,9) end
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
        layout = wibox.container.background,
        bg = beautiful.background,
        panel_widget2
    }

    return panel
end

return _panel