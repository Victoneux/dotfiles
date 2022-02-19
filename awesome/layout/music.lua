local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local _music = function(s)

    local artist_text = wibox.widget {
        widget = wibox.widget.textbox,
        text = "N/A",
        valign = "bottom"
    }

    local title_text = wibox.widget {
        widget = wibox.widget.textbox,
        text = "N/A",
        valign = "top"
    }

    local image = wibox.widget {
        widget = wibox.widget.imagebox,
        image = os.getenv("HOME") .. "/dotfiles/awesome/images/play.png"
    }

    local the_widget = wibox {
        visible = false,
        ontop = true,
        type = 'normal',
        height = 75,
        width = 400,
        screen = s,
        bg = beautiful.transparent,
    }

    local seperator = wibox.widget {
        widget = wibox.widget.seperator,
        forced_width = 10,
        opacity = 0,
    }

    the_widget : setup {
        layout = wibox.container.background,
        bg = beautiful.background,
        {
            widget = wibox.container.margin,
            margins = 10,
            {
                layout = wibox.layout.fixed.horizontal,
                image,
                seperator,
                {
                    layout = wibox.layout.flex.vertical,
                    artist_text,
                    title_text
                }
            }
        }
    }

    awesome.connect_signal("evil::player", function(artist, title, paused)
        artist_text.text = artist
        title_text.text = title
        if paused == true then
            image.image = os.getenv("HOME") .. "/dotfiles/awesome/images/pause.png"
        else
            image.image = os.getenv("HOME") .. "/dotfiles/awesome/images/play.png"
        end
    end)

    return the_widget
end
return _music