local awful = require("awful")
local menubar = require("menubar")

local ass = awful.spawn

return {
	{ { M },     "Left",   awful.tag.viewprev },
	{ { M },     "Right",  awful.tag.viewnext },
	{ { M },     "Escape", awful.tag.history.restore },
	{ { M },     "j",      function() awful.client.focus.byidx(1) end },
	{ { M },     "k",      function() awful.client.focus.byidx(-1) end },
	{ { M },     "w",      function() mymainmenu:show() end },
	{ { M, S },  "q",      function() end },
	{ { M, C },  "r",      awesome.restart },
	{ { C, M1 }, "l",      function() ass(LOCKER) end },
	-- {{M}, "r", function() awful.screen.focused().mypromptbox:run() end},
	{ { M },     "p",      function() menubar.show() end },
	{ { M, S },  "p",      function() menubar.refresh() end },
}
