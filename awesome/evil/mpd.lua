local awful = require("awful")

local function emit_info()
    awful.spawn.easy_async_with_shell("sh -c 'mpc -f ARTIST@%artist%@TITLE@%title%@FILE@%file%@'",
        function(stdout)
            local artist = stdout:match('^ARTIST@(.*)@TITLE')
            local title = stdout:match('@TITLE@(.*)@FILE')
            local status = stdout:match('\n%[(.*)%]')

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
            if status == "playing" then
                paused = false
            else
                paused = true
            end

            awesome.emit_signal("evil::mpd", artist, title, paused)
        end
    )
end

local mpd_script = [[
  sh -c '
    mpc idleloop player
  ']]

emit_info()

awful.spawn.easy_async_with_shell("ps x | grep \"mpc idleloop player\" | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Emit song info with each line printed
    awful.spawn.with_line_callback(mpd_script, {
        stdout = function()
            emit_info()
        end
    })
end)

