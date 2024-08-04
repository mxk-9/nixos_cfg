local beautiful = require("beautiful")
local gears     = require("gears")

modkey          = "Mod4"
-- This is used later as the default terminal and editor to run.
terminal        = "kitty"
editor          = os.getenv("EDITOR")
editor_cmd      = terminal .. " -e " .. editor
home_cfg        = "/home/sny/nixos-cfg/home/wm/awesome/"
theme_path      = home_cfg .. "theme/"

-- Do not use pictures in i3lock, if u using monitor > FHD, it starts freeze
LOCKER          = [[
i3lock \
--color=282a36 \
--layout-color=babbf1 \
--radius 100 \
--ring-width=10 \
--keyhl=cba6f7 \
--ring-color=7dc4e4 \
--ringver-color=c6a0f6 \
--ringwrong-color=ee99a0 \
--pass-media-keys \
--keylayout 0 \
--date-str="" --time-str=""
 ]]

LOCKER          = LOCKER .. " -F -i " .. theme_path .. "spiral_perfecthue_1920x1200.jpg"

TOUCHPAD_STATE  = 1
FONT            = "JetBrains Mono 14"

-- Themes define colours, icons, font and wallpapers.
beautiful.init(theme_path .. "theme.lua")
