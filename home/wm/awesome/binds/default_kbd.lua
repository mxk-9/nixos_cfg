local gears = require("gears")
local awful = require("awful")
local beautiful = require("beautiful")
require("binds.short")

local base = require("binds.key-table.base")
local layout = require("binds.key-table.layout")
local apps = require("binds.key-table.apps")
local hardware = require("binds.key-table.hardware")

local client_kbd = require("binds.key-table.client")

function TablesConcat(...)
    resTable = {}
    for i, v in ipairs({...}) do
        tableSize = #resTable + 1
        for i=tableSize, #v+tableSize do
            resTable[i] = v[i-tableSize]
        end
    end
    return resTable
end

globalkeys = {}
clientkeys = {}

kbd = TablesConcat(
    base,
    layout,
    apps,
    hardware
)

for k, v in pairs(kbd) do
    globalkeys = gears.table.join(globalkeys, awful.key(v[1], v[2], v[3]))
end

-- {{{ Key bindings

for k, v in pairs(client_kbd) do
    clientkeys = gears.table.join(clientkeys, awful.key(v[1], v[2], v[3]))
end

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it work on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = gears.table.join(globalkeys,
        -- View tag only.
        awful.key({ M }, "#" .. i + 9,
                  function ()
                        local screen = awful.screen.focused()
                        local tag = screen.tags[i]
                        if tag then
                           tag:view_only()
                        end
                  end,
                  {description = "view tag #"..i, group = "tag"}),
        -- Toggle tag display.
        awful.key({ M, C }, "#" .. i + 9,
                  function ()
                      local screen = awful.screen.focused()
                      local tag = screen.tags[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end,
                  {description = "toggle tag #" .. i, group = "tag"}),
        -- Move client to tag.
        awful.key({ M, S }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:move_to_tag(tag)
                          end
                     end
                  end,
                  {description = "move focused client to tag #"..i, group = "tag"}),
        -- Toggle tag on focused client.
        awful.key({ M, C, S }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = client.focus.screen.tags[i]
                          if tag then
                              client.focus:toggle_tag(tag)
                          end
                      end
                  end,
                  {description = "toggle focused client on tag #" .. i, group = "tag"})
    )
end

clientbuttons = gears.table.join(
    awful.button({ }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
    end),
    awful.button({ M }, 1, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.move(c)
    end),
    awful.button({ M }, 3, function (c)
        c:emit_signal("request::activate", "mouse_click", {raise = true})
        awful.mouse.client.resize(c)
    end)
)

-- Set keys
root.keys(globalkeys)
-- }}}
