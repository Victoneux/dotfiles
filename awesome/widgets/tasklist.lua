local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local _tasklist = function(s)

    local tasklist_buttons = gears.table.join(
        awful.button({ }, 1, function (c)
            if c == client.focus then c.minimized = true
            else c:emit_signal("request::activate", "tasklist", {raise = true}) end
        end)
    )
    
    local tasklist = awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        layout = {
            layout = wibox.layout.flex.horizontal,
            spacing = 4
        },
        widget_template = {
            widget = wibox.container.background,
            id = 'background_role',
            {
                widget = wibox.container.margin,
                top = 2,
                {
                    widget = wibox.container.background,
                    bg = beautiful.wibar_bg,
                    {
                        widget = wibox.container.margin,
                        left = 12,
                        right = 12,
                        top = 3,
                        bottom = 5,
                        {
                            id = 'icon_role',
                            widget = wibox.widget.imagebox
                        }
                    }
                }
            }
        }
    }
    return tasklist
end

return _tasklist