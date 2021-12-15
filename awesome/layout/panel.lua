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
        type = 'normal',
        height = s.geometry.height-(beautiful.useless_gap*4)-s.wibox.height,
        width = s.geometry.width/4,
        screen = s,
        bg = beautiful.transparent,
    }

    awful.placement.left(panel)

    local panel_widget1 = wibox.widget {
        expand = 'none',
        layout = wibox.layout.fixed.vertical,
        require("widgets/panel/panel_time"),
        require("widgets/panel/panel_spacer"),
        require("widgets/panel/panel_dayweek"),
        require("widgets/panel/panel_spacer"),
        require("widgets/panel/panel_bars"),
        require("widgets/panel/panel_spacer"),
    }

    panel : setup {
        layout = wibox.container.background,
        bg = beautiful.color0,
        {
            widget = wibox.container.margin,
            left = panel.width/5,
            right = panel.width/5,
            top = panel.width/10,
            bottom = 50,
            panel_widget1
        }
    }

    return panel
end

return _panel