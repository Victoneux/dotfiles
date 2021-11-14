local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local _panel = function(s)

    local panel = wibox {
        visible = false,
        ontop = false,
        type = 'normal',
        height = s.geometry.height-(beautiful.useless_gap*4)-s.wibox.height,
        width = 450,
        screen = s,
        bg = beautiful.transparent,
    }

    awful.placement.left(panel)

    local panel_widget1 = wibox.widget {
        expand = 'none',
        layout = wibox.layout.grid,
        -- require("widgets/volume")
    }

    panel : setup {
        layout = wibox.container.background,
        bg = beautiful.color0,
        {
            require("widgets/panel_bars"),
            widget = wibox.container.margin,
            left = panel.width/5,
            right = panel.width/5,
        }
    }

    return panel
end

return _panel