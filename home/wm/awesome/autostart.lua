pcall(require, "luarocks.loader")

local awful = require("awful")
local naughty = require("naughty")

-- Error handling
if awesome.startup_errors then
	naughty.notify({
		preset = naughty.config.presets.critical,
		title = "Oops, there were errors during startup!",
		text = awesome.startup_errors
	})
end

-- Handle runtime errors after startup
do
	local in_error = false
	awesome.connect_signal("debug::error", function(err)
		-- Make sure we don't go into an endless error loop
		if in_error then return end
		in_error = true

		naughty.notify({
			preset = naughty.config.presets.critical,
			title = "Oops, an error happened!",
			text = tostring(err)
		})
		in_error = false
	end)
end
-- }}}

cmd = {
	"picom --config " .. home_cfg .. "picom.conf",
	"nm-applet",
	"unclutter --timeout 1 --jitter 5 --ignore-scrolling",
	"keepassxc",
	"blueman-applet",
	"autoscreend.sh start",
	"powersaverd.sh start"
}

for _, v in pairs(cmd) do
	awful.spawn.easy_async_with_shell(v, function() end)
end
