local awful = require("awful")

local ass = awful.spawn
local aus = awful.util.spawn
-- local asa = awful.spawn.easy_async

function touchpad_toggle()
  TOUCHPAD_STATE = (TOUCHPAD_STATE + 1) % 2
  ass("xinput set-prop 'GXTP7863:00 27C6:01E0 Touchpad' 'Device Enabled' " .. TOUCHPAD_STATE)
end

function volume_level(opt)
  local current = io.popen("pactl get-sink-volume @DEFAULT_SINK@"):read("*all")

  current       = string.sub(current, string.find(current, "/") + 2)
  current       = string.sub(current, 0, 4)

  if (opt == "+") and (tonumber(string.sub(current, 0, string.len(current) - 1)) < 150) then
    awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")
  elseif (opt == "-") then
    awful.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")
  elseif (opt == "m") then
    awful.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")
  end
end

return {
  -- Media control
  { { M },     "#76",           function() aus("playerctl play-pause", false) end },
  { {},        "XF86AudioPlay", function() aus("playerctl play-pause", false) end },
  { { M, S },  "#76",           function() aus("playerctl -a pause", false) end },
  { { M, C },  "#76",           function() aus("playerctl -a play-pause", false) end },
  { { M },     "#95",           function() aus("playerctl previous", false) end },
  { { M },     "#96",           function() aus("playerctl next", false) end },

  -- Brightness
  { {},        "#232",          function() ass("light -U 5") end },
  { {},        "#233",          function() ass("light -A 5") end },

  -- Volume
  -- {{}, "#122", function() update_volume_widget(volume_widget, "-") end},
  -- {{}, "#123", function() update_volume_widget(volume_widget, "+") end},
  -- {{M, M1}, "#95", function() update_volume_widget(volume_widget, "-") end},
  -- {{M, M1}, "#96", function() update_volume_widget(volume_widget, "+") end},

  { {},        "#122",          function() volume_level("-") end },
  { {},        "#123",          function() volume_level("+") end },
  { { M, M1 }, "#95",           function() volume_level("-") end },
  { { M, M1 }, "#96",           function() volume_level("+") end },

  -- Input devices
  ---- Wacom
  { { M, S },  "x",             function() ass("xsetwacom --set 'Wacom One by Wacom M Pen stylus' MapToOutput next") end },
  ---- Toggle touchpad
  { { M },     "x",             function() touchpad_toggle() end },
}
