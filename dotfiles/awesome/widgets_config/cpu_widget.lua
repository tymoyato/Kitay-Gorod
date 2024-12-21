-- CPU
local wibox = require("wibox")
local lain = require("lain")
local markup = lain.util.markup

theme.widget_cpu = theme.dir .. "/icons/widgets/cpu.png"
local cpu_icon = wibox.widget.imagebox(theme.widget_cpu)
local cpu = lain.widget.cpu({
	settings = function()
		widget:set_markup(markup.font(theme.font, markup.fg.color(theme.fg_widget, " " .. cpu_now.usage .. "% ")))
	end,
})
local cpu_widget = wibox.container.background(
	wibox.container.margin(wibox.widget({ cpu_icon, cpu.widget, layout = wibox.layout.align.horizontal }), 0, 0),
	theme.blue
)

return cpu_widget
