-- MEM
local wibox = require("wibox")
local lain = require("lain")
local markup = lain.util.markup

theme.widget_mem = theme.dir .. "/icons/widgets/mem.png"
local mem_icon = wibox.widget.imagebox(theme.widget_mem)
local mem = lain.widget.mem({
	settings = function()
		widget:set_markup(
			markup.font(
				theme.font,
				markup.fg.color(theme.fg_widget, " " .. mem_now.used .. "MB [" .. mem_now.perc .. "%]")
			)
		)
	end,
})
local mem_widget = wibox.container.background(
	wibox.container.margin(wibox.widget({ mem_icon, mem.widget, layout = wibox.layout.align.horizontal }), 0, 0),
	theme.pink
)

return mem_widget