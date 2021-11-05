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
        width = 1920,
        height = 400,
        screen = s,
        bg = beautiful.cool1,
    }

    awful.placement.bottom(panel)

    local panel_widget = wibox.widget {
        expand = 'none',
        spacing = 4,
        layout = wibox.layout.grid
    }
    panel_widget:add_widget_at(require("widgets/profile"), 1, 1, 1, 3)

    panel : setup {
        layout = wibox.container.margin,
        top = 4,
        {
            layout = wibox.container.background,
            bg = beautiful.background,
            panel_widget
        }
    }

    awesome.connect_signal (
        'panel::visibility::toggle',
        function()
            panel:emit_signal('toggle')
        end
    )

    panel:connect_signal(
        'toggle',
        function()
            if panel.visible == true then
                panel.visible = false
            else
                panel.visible = true
            end
        end
    )

    return panel
end

return _panel