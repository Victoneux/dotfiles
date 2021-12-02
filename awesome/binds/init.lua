local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

globalkeys = gears.table.join(
    awful.key({modkey, }, "o", awful.client.movetoscreen),
    awful.key({ modkey, }, "Return", function () awful.spawn(terminal) end),
    awful.key({ modkey, }, "b", function () awful.spawn(browser) end),
    awful.key({ modkey, }, "d", function () awful.spawn(discord) end),
    awful.key({ modkey, }, "r", function () awful.spawn("rofi -theme applauncher.rasi -modi drun -show drun") end),
    awful.key({ modkey, }, "k", function () awful.spawn("bash " .. dot_dir .. "/rofi/powermenu.sh") end),
    awful.key({ modkey, "Control" }, "l", function () awful.spawn("bash " .. dot_dir .. "/rofi/languageswitch.sh") end),
    awful.key({ modkey, }, "v", function () 
        currentscreen = awful.screen.focused()
        if currentscreen.wibox.visible then
            currentscreen.wibox.visible = false
            currentscreen.coolpanel.height = currentscreen.coolpanel.height+currentscreen.wibox.height
            currentscreen.coolpanel.y = currentscreen.coolpanel.y-currentscreen.wibox.height
            currentscreen.music.y = currentscreen.music.y - currentscreen.wibox.height
        else
            currentscreen.wibox.visible = true
            currentscreen.coolpanel.height = currentscreen.coolpanel.height-currentscreen.wibox.height
            currentscreen.coolpanel.y = currentscreen.coolpanel.y+currentscreen.wibox.height
            currentscreen.music.y = currentscreen.music.y + currentscreen.wibox.height
        end
    end),
    awful.key({ modkey, }, "z", function () 
        currentscreen = awful.screen.focused()
        currentscreen.music.visible = not currentscreen.music.visible
    end),
    awful.key({ modkey, }, "l", function() 
        lock_screen_show()
    end),
    awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, }, "Tab",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then
                client.focus:raise()
            end
    end),
    awful.key({ modkey, }, "s", function () awful.screen.focus_relative(1) end),
    awful.key({ modkey, }, ".", function () awful.layout.inc(-1) end),
    awful.key({ modkey, }, ",", function () awful.layout.inc(1) end),
    awful.key({ modkey, }, "#107", function ()
        awful.spawn("flameshot gui -p " .. home_dir .. "/Screenshots/")
    end),
    awful.key({ }, "#107", function ()
        awful.spawn("flameshot screen -c -p " .. home_dir .. "/Screenshots/")
    end),
    awful.key({ modkey, }, "#67", function ()
        os.execute("amixer -D pulse set Master toggle")
    end),
    awful.key({ modkey, }, "#68", function ()
        os.execute("amixer -D pulse set Master 5%-")
    end),
    awful.key({ modkey, }, "#69", function ()
        os.execute("amixer -D pulse set Master 5%+") -- 69 nice
    end),
    awful.key({ modkey, }, "#73", function ()
        os.execute("xset dpms force off")
    end),
    awful.key({ modkey, }, "q", function () 
        currentscreen = awful.screen.focused()
        
        currentscreen.coolpanel.visible = not currentscreen.coolpanel.visible

        if (currentscreen.coolpanel.visible) then
            currentscreen.padding = {
                left = currentscreen.padding.left+currentscreen.coolpanel.width+(beautiful.useless_gap*2),
            }
        else
            currentscreen.padding = {
                left = currentscreen.padding.left-currentscreen.coolpanel.width-(beautiful.useless_gap*2),
            }
        end
    end)
)
clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ modkey }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ modkey }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)
clientkeys = gears.table.join(
    awful.key({ modkey, }, "c", function(c)
        local focused = awful.screen.focused()
        c.floating = true
        awful.placement.centered(c, {
            honor_workarea = true
        })
    end),
    awful.key({ modkey, "Control" }, "c", function(c)
        local focused = awful.screen.focused()
        c.floating = true
        c.width = focused.geometry.width/1.5
        c.height = focused.geometry.height/1.5

        awful.placement.centered(c, {
            honor_workarea = true
        })
    end),
    awful.key({ modkey, }, "z", function (c)
        c.minimized = true
    end),
    awful.key({ modkey, }, "x", function (c)
        c:kill()
    end),
    awful.key({ modkey, }, "f", function (c)
        c.fullscreen = not c.fullscreen
    end),
    awful.key({ modkey, }, "m", function (c)
        c.maximized = not c.maximized
    end),
    awful.key({ modkey, "Control"}, "f", function (c)
        c.floating = not c.floating
    end),
    awful.key({ modkey, }, "t", function (c)
        awful.titlebar.toggle(c)
    end)
)
