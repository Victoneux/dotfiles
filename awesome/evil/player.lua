local awful = require("awful")

local function emit_info()
    awful.spawn.easy_async_with_shell("sh -c 'playerctl metadata'",
        function(stdout)
            local artist = stdout:match('artist(.*)')
            artist = artist:match('^%s*(.*)')
            local title = stdout:match('title(.*)')
            title = title:match('^%s*(.*)')

            if not artist or artist == "" then
              artist = "N/A"
            end
            if not title or title == "" then
              title = stdout:match('@FILE@(.*)@')
              if not title or title == "" then
                  title = "N/A"
              end
            end

            local paused
            paused = false

            awesome.emit_signal("evil::player", artist, title, paused)
        end
    )
end

local mpd_script = [[
  sh -c '
    playerctl metadata title
  ']]

emit_info()

awful.spawn.easy_async_with_shell("ps x | grep \"playerctl metadata title\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Emit song info with each line printed
    awful.spawn.with_line_callback(mpd_script, {
        stdout = function()
            emit_info()
        end
    })
end)

