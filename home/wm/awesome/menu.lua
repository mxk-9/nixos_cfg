local awful = require("awful")
local beautiful = require("beautiful")

function vsync()
end

function monitor_settings(opt)
  local MAIN_MONITOR = "eDP1"
  local EXT_MONITOR = "HDMI1"

  local cmd = { "xrandr" }

  if opt == "auto" then
    cmd[1] = cmd[1] .. " --auto"
  elseif opt == "ext_r" then
    cmd[1] = cmd[1] .. " --output " .. EXT_MONITOR .. " --auto --right-of " .. MAIN_MONITOR
  elseif opt == "mirror" then
    cmd = { cmd[1] .. " --output " .. EXT_MONITOR .. " --off", "xrandr --output " ..
    EXT_MONITOR .. " --auto --scale-from 1920x1080 --same-as " .. MAIN_MONITOR }
  end

  for _, c in ipairs(cmd) do
    awful.spawn(c)
  end
end

exit_menu = {
  { "Suspend", function()
    awful.spawn("systemctl suspend")
    awful.spawn(LOCKER)
  end },
  { "Power off",    function() awful.spawn("shutdown now") end },
  { "Reboot",       function() awful.spawn("shutdown -r now") end },
  { "Quit Awesome", function() awesome.quit() end },
}

monitors = {
  { "Auto",            function() monitor_settings("auto") end },
  { "Extend to Right", function() monitor_settings("ext_r") end },
  { "Mirror",          function() monitor_settings("mirror") end },
  { "Toggle VSYNC",    function() vsync() end }
}

power_menu = {
  { "Performance", function() awful.spawn("powerprofilesctl set performance") end },
  { "Balanced",    function() awful.spawn("powerprofilesctl set balanced") end },
  { "Power saver", function() awful.spawn("powerprofilesctl set power-saver") end },
}

mymainmenu = awful.menu({
  items = {
    -- { "awesome", myawesomemenu, beautiful.awesome_icon },
    { "logout",   exit_menu },
    { "power",    power_menu },
    { "monitors", monitors },
  }
})

mylauncher = awful.widget.launcher({
  image = beautiful.awesome_icon,
  menu = mymainmenu
})
