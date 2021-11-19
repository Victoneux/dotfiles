-- Provides:
-- evil::disk
--      used (integer - mega bytes)
--      total (integer - mega bytes)
local awful = require("awful")

local update_interval = 10

awful.widget.watch("python3 " .. os.getenv("HOME") .. "/.private/info.py", update_interval, function(_, stdout)
    awesome.emit_signal("evil::doge", stdout)
end)
