-- ALSA volume bar
local wibox = require("wibox")
local awful = require("awful")
local lain = require("lain")
local gears = require("gears")

theme.widget_vol = theme.dir .. "/icons/widgets/vol.png"
theme.widget_vol_low = theme.dir .. "/icons/widgets/vol_low.png"
theme.widget_vol_no = theme.dir .. "/icons/widgets/vol_no.png"
theme.widget_vol_mute = theme.dir .. "/icons/widgets/vol_mute.png"
local vol_icon = wibox.widget.imagebox(theme.widget_vol)
theme.volume = lain.widget.alsabar({
	width = 45,
	border_width = 0,
	ticks = true,
	ticks_size = 5,
	notification_preset = { font = theme.font },
	--togglechannel = "IEC958,3",
	settings = function()
		if volume_now.status == "off" then
			vol_icon:set_image(theme.widget_vol_mute)
		elseif volume_now.level == 0 then
			vol_icon:set_image(theme.widget_vol_no)
		elseif volume_now.level <= 50 then
			vol_icon:set_image(theme.widget_vol_low)
		else
			vol_icon:set_image(theme.widget_vol)
		end
	end,
	colors = {
		background = theme.bg_normal,
		mute = red,
		unmute = "#5cb85c",
	},
})
theme.volume.tooltip.wibox.fg = theme.fg_widget
theme.volume.bar:buttons(awful.util.table.join(
	awful.button({}, 1, function()
		awful.spawn.with_shell(string.format("%s -e alsamixer", awful.util.TERMINAL))
	end),
	awful.button({}, 2, function()
		awful.spawn(string.format("%s set %s 100%%", theme.volume.cmd, theme.volume.channel))
		theme.volume.update()
	end),
	awful.button({}, 3, function()
		awful.spawn(
			string.format("%s set %s toggle", theme.volume.cmd, theme.volume.togglechannel or theme.volume.channel)
		)
		theme.volume.update()
	end),
	awful.button({}, 4, function()
		awful.spawn(string.format("%s set %s 1%%+", theme.volume.cmd, theme.volume.channel))
		theme.volume.update()
	end),
	awful.button({}, 5, function()
		awful.spawn(string.format("%s set %s 1%%-", theme.volume.cmd, theme.volume.channel))
		theme.volume.update()
	end)
))
local volumebg = wibox.container.background(theme.volume.bar, "#888888", gears.shape.rectangle)
local vol_widget = wibox.container.margin(volumebg, 2, 7, 4, 4)
local volume_widget = wibox.container.background(
	wibox.container.margin(wibox.widget({ vol_icon, vol_widget, layout = wibox.layout.align.horizontal }), 0, 0),
	theme.lightgrey,
  gears.shape.rounded_bar
)

return volume_widget
