local awful = require("awful")
local ass = awful.spawn

function incwfact_with_check(num)
    -- local client_size = awful.client.
end


return {
    {{M}, "f", function (c)
        c.fullscreen = not c.fullscreen
        c:raise()
    end},
    {{M, S}, "c", function (c) c:kill() end},
    {{M, C}, "space", awful.client.floating.toggle},
    {{M, C }, "Return", function (c) c:swap(awful.client.getmaster()) end},
    {{M}, "o", function (c) c:move_to_screen() end},
    {{M}, "t", function (c) c.ontop = not c.ontop end},
    {{M}, "n", function (c) c.minimized = true end},
    {{M}, "m", function (c)
            c.maximized = not c.maximized
            c:raise()
    end},
    {{modkey, C}, "m", function (c)
            c.maximized_vertical = not c.maximized_vertical
            c:raise()
    end},
    {{modkey, S}, "m", function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c:raise()
    end},
    {{M}, "b", function()
            myscreen = awful.screen.focused()
            myscreen.mywibox.visible = not myscreen.mywibox.visible
    end},

    {{M}, "z", function() awful.client.incwfact( 0.05) end},
    {{M}, "a", function() awful.client.incwfact(-0.05) end},
    -- {{M, S}, "b", function()
    --     for _, c in ipairs(client.get()) do
            
    --     end
    -- end},
}
