local wibox   = require("wibox")
local naughty = require("naughty")
local gears   = require("gears")

battery_widget = wibox.widget.textbox()
battery_widget:set_font(FONT)

battData = "/sys/class/power_supply/BAT1/"
battCache = gears.filesystem.get_xdg_cache_home()
ch_charge = " "

function get_stat()
    local state = io.open(battData.."status", "r")
    local tmp = "" -- state:read()

	if (state == nil) then
		tmp = "None"
	else
		tmp = state:read()
    	state:close()
	end

    return tmp
end

function update_battery_widget(widget)
    local current  = io.open(battData.."capacity", "r")
	local curr = ""

	if (current == nil) then
		curr = "0"
	else
    	curr = current:read()
		current:close()
	end


    local currtext = ch_charge..curr.."%"
    local fcurstat = io.open(battCache.."batteryStat", "r")
    local state    = get_stat()

    if ((tonumber(curr) == 30) and (state == "Discharging") and (state ~= "None")) then
        naughty.notify({
           title        = "Battery is dying!",
           text         = "Level is " .. curr .. " now",
           timeout      = 5,
           position     = "bottom_right",
           fg           = "#ffffff",
           bg           = "#ee11aa",
           border_width = 4,
           border_color = "#ff55ee"
        })
    end

    if not fcurstat then
        fcurstat = io.open(battCache.."batteryStat", "w")
        fcurstat:write(get_stat())
    else
        if (state ~= fcurstat:read()) then
            naughty.notify({
               title        = "Battery is "..string.lower(state),
               text         = "Level is " .. curr .. " now",
               timeout      = 5,
               position     = "bottom_right",
               fg           = "#ffffff",
               bg           = "#ee11aa",
               border_width = 4,
               border_color = "#ff55ee"
            })
            fcurstat:close()
            fcurstat = io.open(battCache.."batteryStat", "w")
            fcurstat:write(state)
        end
    end
    fcurstat:close()

    widget:set_text(currtext)
end

battery_timer = gears.timer({ timeout = 180 })
battery_timer:connect_signal("timeout", function () update_battery_widget(battery_widget) end)
battery_timer:start()

battery_timer:emit_signal("timeout")
