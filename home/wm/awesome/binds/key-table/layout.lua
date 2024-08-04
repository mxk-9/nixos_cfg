local awful = require("awful")
local ass = awful.spawn
local aus = awful.util.spawn
local naughty = require("naughty")

return {
    {{M, S}, "j", function () awful.client.swap.byidx(  1) end},
    {{M, S}, "k", function () awful.client.swap.byidx( -1) end},
    {{M, C}, "j", function () awful.screen.focus_relative( 1) end},
    {{M, C}, "k", function () awful.screen.focus_relative(-1) end},
    {{M}, "u", awful.client.urgent.jumpto},
    {{M}, "Tab", function ()
        awful.client.focus.history.previous()
        if client.focus then client.focus:raise() end
    end},

    {{M}, "l", function () awful.tag.incmwfact( 0.01) end},
    {{M}, "h", function () awful.tag.incmwfact(-0.01) end},
    {{M, S}, "h", function () awful.tag.incnmaster( 1, nil, true) end},
    {{M, S}, "l", function () awful.tag.incnmaster(-1, nil, true) end},
    {{M, C}, "h", function () awful.tag.incncol( 1, nil, true) end},
    {{M, C}, "l", function () awful.tag.incncol(-1, nil, true) end},
    {{M}, "space", function () awful.layout.inc( 1) end},
    {{M, S}, "space", function () awful.layout.inc(-1) end},

    {{M, C}, "n", function ()
        local c = awful.client.restore()
        -- Focus restored client
        if c then
          c:emit_signal(
              "request::activate", "key.unminimize", {raise = true}
          )
        end
    end},
}
