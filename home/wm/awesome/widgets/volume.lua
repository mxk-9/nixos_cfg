local wibox = require("wibox")
local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")

volume_widget = wibox.widget.textbox()
volume_widget:set_font(FONT)

function notify_volume(curr, st)
    naughty.notify({
        text = st..curr,
        timeout = 1
    })
end

function update_volume_widget(widget, comm)
    local vol_state = io.popen("pactl get-sink-mute @DEFAULT_SINK@"):read("*all")
    local current   = io.popen("pactl get-sink-volume @DEFAULT_SINK@"):read("*all")

    current = string.sub(current, string.find(current, "/") + 2)
    current = string.sub(current, 0, 4)

    if (comm == "+") and (tonumber(string.sub(current, 0, string.len(current) - 1)) < 150) then
        awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")
        -- notify_volume(current, " ")
    elseif (comm == "-") then
        awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")
        -- notify_volume(current, " ")
    elseif (comm == "m") then
        awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")
        -- notify_volume(current, "")
    end

    local output = io.popen(
        "echo " .. ((vol_state == "Mute: no") and '  ' or '   ' .. current )
    ):read("*all")

    widget:set_text(output)
end

volume_timer = gears.timer({ timeout = 10 })
volume_timer:connect_signal(
    "timeout",
    function () update_volume_widget(volume_widget, "") end
)
volume_timer:start()

volume_timer:emit_signal("timeout")
