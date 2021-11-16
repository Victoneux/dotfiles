local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")

-- Error Handling
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = tostring(err) })
        in_error = false
    end)
end

-- Theme Init
beautiful.init(gears.filesystem.get_configuration_dir() .. "theme/init.lua")

-- Some Cool Defines
terminal = "kitty"
browser = "firefox --new-window"
discord = "discord"
modkey = "Mod4"
home_dir = "/good/home"

-- Binds require
require("binds")
root.keys(globalkeys)

-- Layouts (Order Matters!)
awful.layout.layouts = {
    awful.layout.suit.tile
}

-- Set the Wallpaper
local function set_wallpaper(s)
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end

-- Screen Handling
screen.connect_signal("property::geometry", set_wallpaper)

awful.screen.connect_for_each_screen(function(s)
    set_wallpaper(s)

    -- Define Desktops
    awful.tag({ "1" }, s, awful.layout.layouts[1])
    -- Spacer
    s.spacer = require("widgets/spacer")
    -- Wibox Init
    s.wibox = awful.wibar(
        {
            position = "top",
            screen = s,
            height = beautiful.topbar_height
        }
    )
    -- Wibox Setup
    s.wibox:setup {
        widget = wibox.layout.align.horizontal,
        expand = "none",
        {
            layout = wibox.layout.fixed.horizontal,
            s.spacer,
            require("widgets/battery"),
        },
        require("widgets/tasklist")(s),
        {
            layout = wibox.layout.fixed.horizontal,
            require("widgets/time"),
            s.spacer
        }
    }

    s.coolpanel = require("layout/panel")(s)
    s.coolpanel.x = s.geometry.x + (beautiful.useless_gap*2)
    s.coolpanel.y = s.wibox.height+(beautiful.useless_gap*2)
end)

-- Awful Rules
awful.rules.rules = {
    { rule = { },
        properties = {
                     focus = awful.client.focus.filter,
                     raise = true,
                     buttons = clientbuttons,
                     keys = clientkeys,
                     screen = awful.screen.preferred,
                     placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    },
    -- Floating windows
    {
        rule_any = {
            instance = {
            "DTA",  -- Firefox addon DownThemAll.
            "copyq",  -- Includes session name in class.
            "pinentry",
            },
            class = {
            "Arandr",
            "Blueman-manager",
            "Gpick",
            "Kruler",
            "MessageWin",  -- kalarm.
            "Sxiv",
            "Tor Browser", -- Needs a fixed window size to avoid fingerprinting by screen size.
            "Wpa_gui",
            "veromix",
            "xtightvncviewer",
            },
            name = {
            "Event Tester",  -- xev.
            "Terminator Preferences",
            },
            role = {
            "AlarmWindow",  -- Thunderbird's calendar.
            "ConfigManager",  -- Thunderbird's about:config.
            "pop-up",       -- e.g. Google Chrome's (detached) Developer Tools.
            }
        }, 
        properties = { floating = true }
    },
    -- Windows to give a titlebar
    {
        rule_any = {
            type = { "normal", "dialog" }
        },
        properties = { titlebars_enabled = false }
    },
    {
        rule_any = {
            name = {
                "Open Folder", "Open File"
            },
        },
        properties = { placement = awful.placement.centered }
    },

    -- Get Rule Name With xprop
}
-- Client Init
client.connect_signal("manage", function (c)
    if awesome.startup then awful.placement.no_offscreen(c) end

    -- Custom icons!

    if c.class == "GitKraken" then -- GitKraken
        local wow = gears.surface(gears.filesystem.get_configuration_dir() .. "/theme/icons/custom_icons/gitkraken.svg")
        c.icon = wow._native
    end
    if c.class == "gdlauncher" then -- GitKraken
        local wow = gears.surface(gears.filesystem.get_configuration_dir() .. "/theme/icons/custom_icons/gdlauncher.png")
        c.icon = wow._native
    end
end)

-- Titlebar Init
client.connect_signal("request::titlebars", function(c)
    local titlebarbuttons = gears.table.join(
        awful.button({ }, 1, function()
        c:emit_signal("request::activate", "titlebar", {raise = true})
        awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
        c:emit_signal("request::activate", "titlebar", {raise = true})
        awful.mouse.client.resize(c)
        end)
    )
    awful.titlebar.enable_tooltip = false
    awful.titlebar(c, {size=beautiful.titlebar_height, position="top"}) : setup {
        {
            layout = wibox.layout.fixed.horizontal,
        },
        {
            layout = wibox.layout.flex.horizontal,
            buttons = titlebarbuttons,
            {
                widget = awful.titlebar.widget.titlewidget(c),
                align = "center"
            }
        },
        {
            layout = wibox.layout.fixed.horizontal,
        },
        layout = wibox.layout.align.horizontal,
        keys = clientkeys,
    }
end)

-- Change Focus to Mouses Window
client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

--Sets Window Corner Rounding and fullscreen/floating properties
client.connect_signal("property::size", function(c)
    local roundamount = 0
    if c.fullscreen
    or c.maximized
    then c.shape =
        function(cr,w,h)
            gears.shape.rounded_rect(cr,w,h,0)
        end
    else
        c.shape =
        function(cr,w,h)
            gears.shape.rounded_rect(cr,w,h,roundamount)
        end
    end
end)

client.connect_signal("property::floating", function(c)
    c.maximized = false
    c.fullscreen = false
end)
client.connect_signal("property::fullscreen", function(c)
    c.maximized = false
    c.floating = false
end)
client.connect_signal("property::maximized", function(c)
    c.floating = false
    c.fullscreen = false
end)

-- Restart Picom on Reload
os.execute('pkill picom')
os.execute('sleep .1')
awful.spawn('picom')
os.execute('pkill fusuma')
awful.spawn('fusuma')

-- Daemons
require("evil")

-- Notifications
require("notifications")

awesome.set_preferred_icon_size(128)