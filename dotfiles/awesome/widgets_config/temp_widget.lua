-- Coretemp (lain, average)
local wibox = require("wibox")
local lain = require("lain")
local markup = lain.util.markup

theme.widget_temp = theme.dir .. "/icons/widgets/temp.png"
local temp_icon = wibox.widget.imagebox(theme.widget_temp)
local temp = lain.widget.temp({
	settings = function()
		WIDGET:set_markup(markup.font(theme.font, markup.fg.color(theme.fg_widget, " " .. CORETEMP_NOW .. "° ")))
	end,
})
local temp_widget = wibox.container.background(
	wibox.container.margin(wibox.widget({ temp_icon, temp.widget, layout = wibox.layout.align.horizontal }), 0, 0),
	theme.red
)

return temp_widget
