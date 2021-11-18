local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local doge_script = [[
    sh -c '
    stats=$(curl "https://api.gemini.com/v1/pubticker/dogeusd" 2>/dev/null)
    price="$(echo $stats | jq ".bid")"
    echo $price
    ']]

local doge = wibox.widget {
    widget = wibox.widget.textbox,
    text = "Ð : ",
}

awful.widget.watch(doge_script, 5, function(_, stdout)
    local doge_price = stdout:match('%d+.%d+')
    doge.text = "Ð : " .. doge_price
end)

local the_widget = wibox.widget {
    layout = wibox.layout.flex.horizontal,
    doge,
    {
        widget = wibox.widget.textbox,
        text = "much crypto",
        align="right",
    }
}

return the_widget