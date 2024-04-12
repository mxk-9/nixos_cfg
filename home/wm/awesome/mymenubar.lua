local beautiful = require("beautiful")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local menubar = require("menubar")
local screen = require("awful.screen")

beautiful.menubar_border_color = "#282a3688"
beautiful.menubar_border_width = dpi(5)

scr = {w = 1920, h = 1080}

menubar.right_margin = 10
menubar.left_margin = 10
