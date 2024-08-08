local awful = require("awful")
local ass = awful.spawn
local ash = awful.spawn.easy_async_with_shell
-- local aus = awful.util.spawn

local pic_folder = " /home/" .. os.getenv("USER") .. "/Pictures/"
-- local scrot_base = "scrot -F "..pic_folder.."$(date +%Y-%m-%d_%H-%M-%S).png".." -e 'xclip -selection clipboard -t image/png -i $f' -q 100"
-- Adapt for nushell
local scrot_base = "scrot -e 'xclip -selection clipboard -t image/png -i $f' -q 100"

function get_date_file_name()
  local curr_time = os.date("%Y-%m-%d_%H-%M-%S")
  curr_time = " -F " .. pic_folder .. curr_time .. ".png"
  return curr_time
end

function control_picom(opt)
  local cfg_path = home_cfg .. "picom.conf"
  local cmd = "picom"
  local kill_nu = "kill -9 (pgrep picom | into int)"
  local kill_sh = "pkill picom"
  local kill = kill_sh

  if opt == "blur" then
    cmd = cmd .. " --config " .. cfg_path
  elseif opt == "vsync" then
    cmd = cmd .. " --vsync"
  elseif opt == "kill" then
    cmd = kill
  end

  ass(cmd)
end

return {
  -- Favorite apps
  { { M },     "#67",    function() ass("firefox") end },
  { { M },     "#68",    function() ass("pavucontrol") end },
  { { M },     "#69",    function() ass("telegram-desktop") end },
  { { M },     "#70",    function() ass("gimp") end },

  { { M, M1 }, "#69",    function() ass("discord") end },
  { { M, M1 }, "#68",    function() ass("blueman-manager") end },
  { { M },     "Return", function() awful.spawn(terminal) end },

  -- Screenshot
  { {},        "Print",  function() ash(scrot_base .. get_date_file_name(), function() end) end },
  { { C },     "Print",  function() ash(scrot_base .. " -u" .. get_date_file_name(), function() end) end },
  { { M },     "Print",  function() ash(scrot_base .. " -s --freeze" .. get_date_file_name(), function() end) end },

  { { M },     "s",      function() ash(scrot_base .. get_date_file_name(), function() end) end },
  { { M, C },  "s",      function() ash(scrot_base .. " -u" .. get_date_file_name(), function() end) end },
  { { M, S },  "s",      function() ash(scrot_base .. " -s --freeze" .. get_date_file_name(), function() end) end },

  -- Picom
  { { M },     "#74",    function() control_picom("blur") end },
  { { M, S },  "#74",    function() control_picom("vsync") end },
  { { M, M1 }, "#74",    function() control_picom("kill") end },
}
