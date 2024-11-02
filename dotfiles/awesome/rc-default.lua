local awesome, client, mouse, screen, tag = awesome, client, mouse, screen, tag
local ipairs, string, os, table, tostring, tonumber, type = ipairs, string, os, table, tostring, tonumber, type

local gears         = require("gears")
local awful         = require("awful")
                      require("awful.autofocus")
local wibox         = require("wibox")
local beautiful     = require("beautiful")
local naughty       = require("naughty")
local lain          = require("lain")
local scratch       = require("scratch")
local freedesktop   = require("freedesktop")
local hotkeys_popup = require("awful.hotkeys_popup").widget

-- Autostart programs
-- run_once({ "kbdd" })
-- run_once({ "perwindowlayoutd" })
-- run_once({ "nm-applet -sm-disable" })
-- run_once({ "compton" })
-- run_once({ "wmname LG3D" }) -- Fix for java applications
-- run_once({ "xautolock -time 10 -locker '/usr/share/i3lock-fancy/lock -f Meslo-LG-S-Regular -t Locked' -- scrot" })
-- Variable definitions
-- Set false to disable titlebar
-- local window_titlebar = true  
-- local modkey       = "Mod4"
-- local altkey       = "Mod1"

-- Naughty presets
naughty.config.defaults.timeout = 5
naughty.config.defaults.screen = 1
naughty.config.defaults.position = "top_right"
naughty.config.defaults.margin = 8
naughty.config.defaults.gap = 1
naughty.config.defaults.ontop = true
naughty.config.defaults.font = "Meslo LGS Regular 10"
naughty.config.defaults.icon = nil
naughty.config.defaults.icon_size = 32
naughty.config.defaults.fg = beautiful.fg_tooltip
naughty.config.defaults.bg = beautiful.bg_tooltip
naughty.config.defaults.border_color = beautiful.border_tooltip
naughty.config.defaults.border_width = 2
naughty.config.defaults.hover_timeout = nil

-- local theme_path = string.format("%s/.config/awesome/themes/%s/theme.lua", os.getenv("HOME"), chosen_theme)
-- beautiful.init(theme_path)

-- Screen
-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", function(s)
    -- Wallpaper
    if beautiful.wallpaper then
        local wallpaper = beautiful.wallpaper
        -- If wallpaper is a function, call it with the screen
        if type(wallpaper) == "function" then
            wallpaper = wallpaper(s)
        end
        gears.wallpaper.maximized(wallpaper, s, true)
    end
end)
-- Create a wibox for each screen and add it
awful.screen.connect_for_each_screen(function(s) beautiful.connect(s) end)

-- Key bindings
globalkeys = awful.util.table.join(
    -- Default client focus
    awful.key({ altkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
        end,
        {description = "focus next by index", group = "client"}
    ),
    awful.key({ altkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
        end,
        {description = "focus previous by index", group = "client"}
    ),
    -- Programms
    -- awful.key({                   }, "XF86Launch1", function()  awful.util.spawn("subl3") end),
    -- awful.key({ modkey            }, "v", function() awful.util.spawn_with_shell("vivaldi-snapshot") end ),
    -- awful.key({ modkey            }, "t", function() awful.util.spawn_with_shell("caja") end ),
    -- awful.key({ modkey            }, "r", function() awful.util.spawn('urxvt -e ranger') end ),
    -- awful.key({                   }, "F11", function() awful.util.spawn('qpaeq') end ),
    -- --awful.key({ modkey            }, "l", function() awful.util.spawn_with_shell("~/.config/scripts/lock.sh") end),
    -- awful.key({                   }, "Print", function() awful.util.spawn("scrot -e 'mv %f ~/screenshots/'") end),
    -- --awful.key({ }, "F4", function () scratch.drop("weechat", "bottom", "left", 0.60, 0.60, true, mouse.screen) end),
    -- --awful.key({ }, "F6", function () scratch.drop("smuxi-frontend-gnome", "bottom", "left", 0.60, 0.60, true, mouse.screen) end),
    -- awful.key({ }, "F2", function () scratch.drop("telegram-desktop", "bottom", "right", 0.50, 0.60, true, mouse.screen) end),
    -- awful.key({ }, "F3", function () scratch.drop("urxvt -e ranger", "center", "center", 0.75, 0.7, true, mouse.screen) end),
    -- awful.key({ }, "F12", function () awful.util.spawn_with_shell("~/.config/scripts/translate_new.sh \"".. translate_service.. "\"",false) end),

    -- awful.key({ modkey, "Control" }, "n",
    --           function ()
    --               local c = awful.client.restore()
    --               -- Focus restored client
    --               if c then
    --                   client.focus = c
    --                   c:raise()
    --               end
    --           end,
    --           {description = "restore minimized", group = "client"}),

    -- -- Dropdown application
    -- awful.key({ modkey, }, "z", function () awful.screen.focused().quake:toggle() end,
    --           {description = "dropdown application", group = "launcher"}),

    -- -- Widgets popups
    -- awful.key({ altkey, }, "c", function () lain.widget.calendar.show(7) end,
    --           {description = "show calendar", group = "widgets"}),
    -- awful.key({ altkey, }, "h", function () if beautiful.fs then beautiful.fs.show(7) end end,
    --           {description = "show filesystem", group = "widgets"}),
    -- awful.key({ altkey, }, "w", function () if beautiful.weather then beautiful.weather.show(7) end end,
    --           {description = "show weather", group = "widgets"}),

    -- -- Brightness
    -- awful.key({ }, "XF86MonBrightnessUp", function () awful.util.spawn("xbacklight -inc 10") end,
    --           {description = "+10%", group = "hotkeys"}),
    -- awful.key({ }, "XF86MonBrightnessDown", function () awful.util.spawn("xbacklight -dec 10") end,
    --           {description = "-10%", group = "hotkeys"}),

    -- -- ALSA volume control
    -- awful.key({  }, "XF86AudioRaiseVolume",
    --     function ()
    --         os.execute(string.format("amixer -q set %s 5%%+", beautiful.volume.channel))
    --         beautiful.volume.update()
    --     end,
    --     {description = "volume up", group = "hotkeys"}),
    -- awful.key({  }, "XF86AudioLowerVolume",
    --     function ()
    --         os.execute(string.format("amixer -q set %s 5%%-", beautiful.volume.channel))
    --         beautiful.volume.update()
    --     end,
    --     {description = "volume down", group = "hotkeys"}),
    -- awful.key({  }, "XF86AudioMute",
    --     function ()
    --         os.execute(string.format("amixer -q set %s toggle", beautiful.volume.togglechannel or beautiful.volume.channel))
    --         beautiful.volume.update()
    --     end,
    --     {description = "toggle mute", group = "hotkeys"}),
    -- awful.key({ altkey, "Control" }, "m",
    --     function ()
    --         os.execute(string.format("amixer -q set %s 100%%", beautiful.volume.channel))
    --         beautiful.volume.update()
    --     end,
    --     {description = "volume 100%", group = "hotkeys"}),
    -- awful.key({ altkey, "Control" }, "0",
    --     function ()
    --         os.execute(string.format("amixer -q set %s 0%%", beautiful.volume.channel))
    --         beautiful.volume.update()
    --     end,
    --     {description = "volume 0%", group = "hotkeys"}),

    -- MPD control
    -- awful.key({ altkey, "Control" }, "Up",
    --     function ()
    --         awful.spawn.with_shell("mpc toggle")
    --         beautiful.mpd.update()
    --     end,
    --     {description = "mpc toggle", group = "widgets"}),
    -- awful.key({ altkey, "Control" }, "Down",
    --     function ()
    --         awful.spawn.with_shell("mpc stop")
    --         beautiful.mpd.update()
    --     end,
    --     {description = "mpc stop", group = "widgets"}),
    -- awful.key({ altkey, "Control" }, "Left",
    --     function ()
    --         awful.spawn.with_shell("mpc prev")
    --         beautiful.mpd.update()
    --     end,
    --     {description = "mpc prev", group = "widgets"}),
    -- awful.key({ altkey, "Control" }, "Right",
    --     function ()
    --         awful.spawn.with_shell("mpc next")
    --         beautiful.mpd.update()
    --     end,
    --     {description = "mpc next", group = "widgets"}),
    -- awful.key({ altkey }, "0",
    --     function ()
    --         local common = { text = "MPD widget ", position = "top_middle", timeout = 2 }
    --         if beautiful.mpd.timer.started then
    --             beautiful.mpd.timer:stop()
    --             common.text = common.text .. lain.util.markup.bold("OFF")
    --         else
    --             beautiful.mpd.timer:start()
    --             common.text = common.text .. lain.util.markup.bold("ON")
    --         end
    --         naughty.notify(common)
    --     end,
    --     {description = "mpc on/off", group = "widgets"}),

    -- Copy primary to clipboard (terminals to gtk)
    -- awful.key({ modkey }, "c", function () awful.spawn("xsel | xsel -i -b") end,
    --           {description = "copy terminal to gtk", group = "hotkeys"}),
    -- Copy clipboard to primary (gtk to terminals)
    -- awful.key({ altkey }, "v", function () awful.spawn("xsel -b | xsel") end,
    --           {description = "copy gtk to terminal", group = "hotkeys"}),

-- Set keys
root.keys(globalkeys)