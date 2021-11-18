local pam = require("liblua_pam")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local authenticate = function(password)
    return pam.auth_current_user(password)
end

local the_text_box = wibox.widget {
    widget = wibox.widget.textbox,
    text = "",
    font = "Roboto Condensed 16"
}

local lock_screen_box = wibox {
    visible = false,
    ontop = true,
    input_passthrough = false,
    type = "splash",
    bgimage = "theme/wallpaper.jpg",
    screen = screen.primary,
}
awful.placement.maximize(lock_screen_box)

local new_cover = function(s)
    local cover_box = wibox {
        visible = false,
        ontop = true,
        type = "splash",
        screen = s,
    }

    cover_box : setup {
        widget = wibox.container.background,
        bgimage = "theme/wallpaper.jpg",
        forced_width = s.geometry.width,
        forced_height = s.geometry.height
    }

    return cover_box
end

awful.placement.maximize(lock_screen_box)

awful.screen.connect_for_each_screen(function(s)
    if s == screen.primary then
        s.lockscreen = lock_screen_box
    else
        s.lockscreen = new_cover(s)
    end
end)

local set_lock_visibility = function(v)
    for s in screen do
        s.lockscreen.visible = v
    end
end

local characters_entered = 0

reset_lock = function()
    characters_entered = 0
    the_text_box.text = ""
end

grab_password = function()
    awful.prompt.run {
        hooks = require("lock/toblock"),
        keypressed_callback = function(mod, key, cmd)
            if #key == 1 then
                characters_entered = characters_entered + 1
                the_text_box.text = the_text_box.text .. "*"
            elseif key == "BackSpace" then
                if characters_entered > 0 then
                    characters_entered = characters_entered - 1
                    the_text_box.text = the_text_box.text:sub(1,-2)  
                end
            end
        end,
        exe_callback = function(input)
            if authenticate(input) then
                set_lock_visibility(false)
                reset_lock()
            else
                reset_lock()
                grab_password()
            end
        end,
        textbox = wibox.widget.textbox()
    }
end

the_text_box.point = function(geo, args)
    return {
        x = (args.parent.width-geo.width)/2,
        y = (args.parent.height-geo.height)/2
    }
end

local the_info_box = require("lock/info")
local lock_notif = require("lock/lock_notif")

the_info_box.point = function(geo, args)
    return {
        x = 0,
        y = (args.parent.height-geo.height)
    }
end
lock_notif.point = function(geo, args)
    return {
        x = (args.parent.width-geo.width),
        y = 0
    }
end

lock_screen_box : setup {
    widget = wibox.container.background,
    bgimage = os.getenv("HOME") .. "/dotfiles/awesome/theme/wallpaper.2.jpg",
    {
        widget = wibox.container.margin,
        margins = 100,
        {
            layout = wibox.layout.manual,
            the_text_box,
            the_info_box,
            lock_notif
        }
    }
}

function lock_screen_show()
    set_lock_visibility(true)
    grab_password()
end