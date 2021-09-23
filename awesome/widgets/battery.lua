local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local thewidget = wibox.widget {
    widget = awful.widget.watch("acpi -i", 2, function(widget, stdout)
        local charging = string.match(stdout, ":%D+")
        local waste, battery = string.match(stdout, "(%d+)%D+(%d+)")
        battery = tonumber(battery)
        local icon = ""
        if charging == ': Charging, ' then
            if battery > 0 and battery <= 10 then
                icon = "" .. "+"
            elseif battery > 10 and battery <= 20 then
                icon = "" .. "+"
            elseif battery > 20 and battery <= 30 then
                icon = "" .. "+"
            elseif battery > 30 and battery <= 40 then
                icon = "" .. "+"
            elseif battery > 40 and battery <= 50 then
                icon = "" .. "+"
            elseif battery > 50 and battery <= 60 then
                icon = "" .. "+"
            elseif battery > 60 and battery <= 70 then
                icon = "" .. "+"
            elseif battery > 70 and battery <= 80 then
                icon = "" .. "+"
            elseif battery > 80 and battery <= 90 then
                icon = "" .. "+"
            elseif battery > 90 and battery <= 100 then
                icon = "" .. "+"
            end
        elseif charging == ': Charged, ' then
            icon = ""
        else
            if battery > 0 and battery <= 10 then
                icon = ""
            elseif battery > 10 and battery <= 20 then
                icon = ""
            elseif battery > 20 and battery <= 30 then
                icon = ""
            elseif battery > 30 and battery <= 40 then
                icon = ""
            elseif battery > 40 and battery <= 50 then
                icon = ""
            elseif battery > 50 and battery <= 60 then
                icon = ""
            elseif battery > 60 and battery <= 70 then
                icon = ""
            elseif battery > 70 and battery <= 80 then
                icon = ""
            elseif battery > 80 and battery <= 90 then
                icon = ""
            elseif battery > 90 and battery <= 100 then
                icon = ""
            end
        end
        widget:set_text(icon .. " " .. battery .. "%")
        return
    end)
}

return thewidget