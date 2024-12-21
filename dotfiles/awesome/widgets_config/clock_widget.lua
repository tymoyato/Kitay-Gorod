-- Clock 
local wibox = require("wibox")
local awful = require("awful")
local lain = require("lain")

theme.widget_clock = theme.dir .. "/icons/widgets/clock.png"
local clock_icon = wibox.widget.imagebox(theme.widget_clock)
local clock = awful.widget.textclock('<span font="Meslo LGS Regular 10" color="#32302f"> %a %d %b  %H:%M </span>')
local clock_widget = wibox.container.background(
    wibox.container.margin(wibox.widget({ clock_icon, clock, layout = wibox.layout.align.horizontal }), 0, 1),
    theme.violet
)

-- Calendar
local calendar = lain.widget.calendar({
    cal = "cal --color=always",
    attach_to = { clock_widget },
    notification_preset = {
        font = "Meslo LGS Regular 10",
        fg = theme.fg_normal,
        bg = theme.bg_normal,
    },
})

return clock_widget
