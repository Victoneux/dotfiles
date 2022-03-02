local awful = require("awful")

local function emit_info()
  awful.spawn.easy_async_with_shell("sh -c 'playerctl metadata && tempcmd=$(playerctl status) && echo gaylolstat:$tempcmd'",
    function(stdout)
      local music_artist
      local music_title
      local music_paused = ""

      music_artist = stdout:match('xesam:artist(.*)')
      if music_artist then
        music_artist = music_artist:match('^%s*(.*)')
      else
        music_artist = "N/A"
      end
      music_title = stdout:match('xesam:title(.*)')
      if music_title then
        music_title = music_title:match('^%s*(.*)')
      else
        music_title = "N/A"
      end

      music_paused = stdout:match('gaylolstat:(.*)')
      
      if music_paused then
        if string.match(music_paused, "Playing") then
          music_paused = false
        else
          music_paused = true
        end
      end

      awesome.emit_signal("evil::player", music_artist, music_title, music_paused)
    end)
end

awful.widget.watch('playerctl metadata', 0.5, function(widget, stdout)
  emit_info()
end)

